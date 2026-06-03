import logging
import os
import json

import boto3
from botocore.config import Config

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    logger.info(f'EVENT-RECEIVED')
    logger.info(f'{event["body"]}')
    resp = {}
    logger.info(f'response: {resp}')
    response = {
        'statusCode': 200,
        'headers': {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'},
        'body': json.dumps(resp)
    }
    return response