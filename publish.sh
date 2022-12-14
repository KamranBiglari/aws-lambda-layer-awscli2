#!/bin/bash -e

# AWS Regions
REGIONS=(
    "us-east-1"
    "eu-west-1"
    "eu-west-2"
)
LAYER_NAME="awscli2-layer"

for region in ${REGIONS[@]}; do
    echo "Publishing layer to $region..."

    LAYER_ARN=$(aws lambda publish-layer-version --profile $profile --region $region --layer-name $LAYER_NAME --description "AWSCLI2 Layer [https://github.com/KamranBiglari/aws-lambda-layer-awscli2]" --compatible-runtimes provided --license MIT --zip-file fileb://export/layer.zip | jq -r .LayerVersionArn)
    
    echo $LAYER_ARN
    echo "$region complete for Staging"
    echo ""
done

echo "Successfully published to all regions"