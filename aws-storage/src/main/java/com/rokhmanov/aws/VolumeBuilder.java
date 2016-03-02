package com.rokhmanov.aws;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.ec2.AmazonEC2;
import com.amazonaws.services.ec2.AmazonEC2Client;
import com.amazonaws.services.ec2.model.CreateVolumeRequest;
import com.amazonaws.services.ec2.model.CreateVolumeResult;
import com.amazonaws.services.ec2.model.DescribeAvailabilityZonesResult;
import com.amazonaws.services.ec2.model.DescribeInstancesResult;
import com.amazonaws.services.ec2.model.DescribeVolumesRequest;
import com.amazonaws.services.ec2.model.DescribeVolumesResult;
import com.amazonaws.services.ec2.model.Instance;
import com.amazonaws.services.ec2.model.Reservation;
import com.amazonaws.services.ec2.model.Volume;

public class VolumeBuilder {
	
	static AmazonEC2 ec2;

	private static void init() throws Exception{
		AWSCredentials credentials = null;
		try{
			credentials = new ProfileCredentialsProvider("arokhmanov").getCredentials();			
		} catch (Exception e){
            throw new AmazonClientException(
                    "Cannot load the credentials from the credential profiles file. " +
                    "Please make sure that your credentials file is at the correct " +
                    "location (~/.aws/credentials), and is in valid format.",
                    e);			
		}
        ec2 = new AmazonEC2Client(credentials);
        ec2.setEndpoint("ec2.us-west-2.amazonaws.com");
	}
	
	private static void list(){
        try {
            DescribeAvailabilityZonesResult availabilityZonesResult = ec2.describeAvailabilityZones();
            System.out.println("You have access to " + availabilityZonesResult.getAvailabilityZones().size() +
                    " Availability Zones.");

            DescribeInstancesResult describeInstancesRequest = ec2.describeInstances();
            List<Reservation> reservations = describeInstancesRequest.getReservations();
            Set<Instance> instances = new HashSet<Instance>();

            for (Reservation reservation : reservations) {
                instances.addAll(reservation.getInstances());
            }

            System.out.println("You have " + instances.size() + " Amazon EC2 instance(s) running.");
            
            DescribeVolumesRequest descVolReq = new DescribeVolumesRequest();
            DescribeVolumesResult descVolRes = ec2.describeVolumes(descVolReq);
            List<Volume> volumes = descVolRes.getVolumes();
            System.out.println("You have " + volumes.size() + " Volumes defined.");
            for (Volume volume : volumes) {
				System.out.println(volume);
			}
            		
        } catch (AmazonServiceException ase) {
                System.out.println("Caught Exception: " + ase.getMessage());
                System.out.println("Reponse Status Code: " + ase.getStatusCode());
                System.out.println("Error Code: " + ase.getErrorCode());
                System.out.println("Request ID: " + ase.getRequestId());
        }		
	}
	

	private static void createVolumes(int numVolumes, int sizeGB) {
		for (int i = 0; i < numVolumes; i++) {
			CreateVolumeRequest volReq = new CreateVolumeRequest(sizeGB, "us-west-2b");
			volReq.setVolumeType("gp2");
			CreateVolumeResult volRes = ec2.createVolume(volReq);
			System.out.println("Requested New Volume:" + volRes);
		}
	}
	
	public static void main(String[] args) throws Exception {
		init();
		createVolumes(6, 700);
		list();
	}


}
