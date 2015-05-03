# amazon-pn-scraper
A short script I wrote to get certain product numbers from Amazon. Basically, some items have a <select> box where you can select item flavors, colors, sizes, etc. I wanted to be able to easily grab the product numbers for all of those items in one go, rather than click individual ones. This script writes the product numbers to a CSV file for later use and might come in handy if you want to display all the versions of a product using the product advertising API.

To use it, just put in the URL of a product. You may need to change around some of the element classes/ids that I used based on the item.
