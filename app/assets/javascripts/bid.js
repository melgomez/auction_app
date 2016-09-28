// app = angular.module("Bidder", ["ngResource"])
//
// app.factory "Bid", ["$resource", ($resource) ->
// resource_url = $('form#new-bid-form').attr('action') + ".json"
// $resource(resource_url, {id: "@id" }, {update: {method: "PUT"}})
// ]
//
// @BidCtrl = ["$scope", "Bid", ($scope, Bid) ->
// $scope.bids = Bid.query()
// ]
//
// app.controller "BidCtrl", BidCtrl

$('document').ready(function() {
	var auction_end = $('span.auction-end').html();

	// gets the curent date
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() + 1;
	//January is 0!
	var yyyy = today.getFullYear();

	if (dd < 10) {
		dd = '0' + dd;
	}

	if (mm < 10) {
		mm = '0' + mm;
	}

	today = mm + '/' + dd + '/' + yyyy;

	if ((new Date(auction_end) / 1000 ) > (new Date(today) / 1000 )) {
		$('#item-auction-end').countdown({
			timestamp : new Date(auction_end)
		});
	} else {
		$('#item-auction-end').append(" : Auction is no longer open");
	}
});

