# Cloud Watch

AWS CloudWatch is a monitoring and observability service that helps track metrics, logs, and events across AWS resources and applications.

It is used for:

  1. Monitoring
  2. Logging
  3. Alerting
  4. Visualization
  5. Automation

# Metrics

Metrics are numerical data points that represent the performance or usage of AWS resources.

Examples:
           EC2 CPU utilization

           Network in/out
           
           Disk read/write operations
           
# Key Points:
Default EC2 monitoring → 5-minute intervals

Detailed monitoring → 1-minute intervals

CloudWatch provides near real-time, not exact real-time metrics

Application-level metrics (e.g., API request count) require custom metrics or CloudWatch Agent

# Custom Metrics

A custom metric is a metric that you define and send to CloudWatch manually, because AWS does not provide it by default.

Ex: Memory utilization, Disk usage

Custom metrics are not automatic

  They appear only after first push

  You must continuously send data
  
  They can be used in alarms & dashboards

Custom metrics cannot be manually deleted . Metrics expire after 15 months of inactivity

# Alarms

CloudWatch Alarms monitor metrics and trigger actions based on thresholds.

Example:
      
  If CPU utilization > 70%, trigger alert
  
     Actions:
     
      Send notification (SNS)
      
      Trigger Auto Scaling
      
      Invoke Lambda function
      
# Logs

CloudWatch Logs store and manage log data from AWS services and applications.

Log Components:

  Log Groups → collection of logs
  
  Log Streams → sequence of log events
  
-> Some services auto-create log groups (Lambda, CodeBuild)

-> Others require manual configuration (API Gateway)

# Logs Insights

CloudWatch Logs Insights allows querying logs using a query language.

  Used for:
  
    Debugging
    
    Searching logs
    
    Analyzing patterns
    
    Custom Metrics

CloudWatch allows creating custom metrics for additional monitoring.

Example:
  Memory utilization (not available by default)
  
  Application-specific metrics
  
  
# Integration & Automation
  
  CloudWatch integrates with:
  
    EC2 Auto Scaling (for scaling resources)
    
    AWS Lambda (for automation)
    
# VPC Flow Logs

Captures network traffic information in a VPC.

Can be stored in CloudWatch Logs

Helps in network troubleshooting and security analysis

# Cost Optimization
  CloudWatch helps identify:
  
    Underutilized resources
    
    Overutilized resources
    
Automation can be implemented using Lambda and alarms.



