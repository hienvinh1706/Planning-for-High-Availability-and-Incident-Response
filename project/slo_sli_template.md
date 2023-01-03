# API Service


| Category     | SLI                                                                              | SLO                                                                                                         |
|--------------|----------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Availability | Total number of successful requests (HTTP status 200) / Total number of requests | 99%                                                                                                         |
| Latency      | Time taken by 90% of the requests in the last n minutes less than 100ms          | 90% of requests below 100ms                                                                                 |
| Error Budget | Total number of successful requests equal or exceed 80%                          | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   | Number of successful requests (HTTP status 200) within the last n seconds        | 5 RPS indicates the application is functioning                                                              |