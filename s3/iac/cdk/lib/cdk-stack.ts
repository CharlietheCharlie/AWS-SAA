import { Stack, StackProps } from 'aws-cdk-lib';
import * as s3 from 'aws-cdk-lib/aws-s3';
import { Construct } from 'constructs';

export class CdkStack extends Stack {
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props);

     // create an S3 bucket in this stack
     new s3.Bucket(this, 'MyBucket', {
      versioned: true, 
    });
  }
}
