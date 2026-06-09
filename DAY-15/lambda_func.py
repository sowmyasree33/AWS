import json
import boto3
config = boto3.client('config')
REQUIRED_TAGS = ["Owner", "Environment", "Project"]
def lambda_handler(event, context):
    invoking_event = json.loads(event['invokingEvent'])
    configuration_item = invoking_event['configurationItem']
    tags = configuration_item.get('tags', {})
    compliance_type = "COMPLIANT"
    for tag in REQUIRED_TAGS:
        if tag not in tags:
            compliance_type = "NON_COMPLIANT"
            break
    config.put_evaluations(
        Evaluations=[
            {
                'ComplianceResourceType': configuration_item['resourceType'],
                'ComplianceResourceId': configuration_item['resourceId'],
                'ComplianceType': compliance_type,
                'OrderingTimestamp': configuration_item['configurationItemCaptureTime']
            },
        ],
        ResultToken=event['resultToken']
    )

    return {
        'compliance_type': compliance_type
    }