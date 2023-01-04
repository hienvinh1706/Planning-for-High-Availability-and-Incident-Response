# API Service


| Category     | SLI                                                                              | SLO                                                                                                         |
|--------------|----------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Availability | Total number of successful requests (HTTP status 200) / Total number of requests | 99%                                                                                                         |
| Latency      | Number of requests completed within 100ms in last 5m          | 90% of requests below 100ms                                                                                 |
| Error Budget | Total number of successful requests / Total number of request                          | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   | Number of successful requests (HTTP status 200) within the last n seconds        | 5 RPS indicates the application is functioning                                                              |