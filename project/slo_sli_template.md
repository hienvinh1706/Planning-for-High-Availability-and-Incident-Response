# API Service


| Category     | SLI                                                                              | SLO                                                                                                         |
|--------------|----------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Availability | Total number of successful requests (HTTP status 200) / Total number of requests | 99%                                                                                                         |
| Latency      | buckets of requests time (less than 100ms) in a histogram showing the 90th percentile over the last n minutes       | 90% of requests below 100ms                                                                                 |
| Error Budget | Total number of successful requests / Total number of request must greater or equal 80%                       | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   | Number of successful requests (HTTP status 200) within the last n seconds        | 5 RPS indicates the application is functioning                                                              |