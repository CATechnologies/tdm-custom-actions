# TDM Custom Actions

This repository contains sample implementation of pre/post publish actions for CA Test Data Manager (TDM).

To learn more about TDM pre/post publish actions, please visit 
[TDM online documentation](https://docops.ca.com/ca-test-data-manager/4-7/en/ca-test-data-manager-portal-in-linux/tdm-rest-actionservice-container).

   * [echo](echo/README.md) - simply echo all parameters, do nothing
   * [download-and-copy](download-and-copy/README.md) - download generated CSV files from TDM and copy to a remote host
   * [download-and-send-email](download-and-send-email/README.md) - download generated CSV files from TDM send in an e-mail (you can use e.g. [FakeSMTP](http://nilhcem.com/FakeSMTP/)
to receive e-mails)
   * [db-log](db-log/README.md) - store information about invocations of pre/post build actions in a database table
   
## Prerequisites
   1. Docker is installed on your machine.
   1. tdm.packages.ca.com/tdm/action-service:$tdmVersion docker image is in your local docker images (follow 
   [instructions](https://docops.ca.com/ca-test-data-manager/4-7/en/ca-test-data-manager-portal-in-linux/install-tdm-portal-in-linux)
    to download TDM docker distribution)

All sample actions in this repository assume that TDM action-service docker image has the "long tag" 
(tdm.packages.ca.com/tdm/action-service:$tdmVersion). Run the following command to add the "long tag":

`docker tag tdm/action-service:4.7.0.14 tdm.packages.ca.com/tdm/action-service:4.7.0.14`

Note: Your TDM local docker images will have "short tag" when you build them with TDM image kit or extract them from 
TDM image bundle.
 
   
