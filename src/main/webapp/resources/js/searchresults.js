
function toasterOptions() {
		toastr.options = {
			"closeButton" : true,
			"debug" : false,
			"newestOnTop" : false,
			"progressBar" : false,
			"positionClass" : "toast-top-right",
			"preventDuplicates" : true,
			"onclick" : null,
			"showDuration" : "300",
			"hideDuration" : "1000",
			"timeOut" : "5000",
			"extendedTimeOut" : "1000",
			"showEasing" : "swing",
			"hideEasing" : "linear",
			"showMethod" : "fadeIn",
			"hideMethod" : "fadeOut"
		};
	};

		$(".selectable").each(
				function(indexi) {
					$(".fac-" + indexi).bind("mousedown", function(e) {
						e.metaKey = true; }).selectable({
								filter : ".enabled",
								stop : function() {
									var result = $(".showarea-" + indexi).empty();
									var result2 = $(".resultarea").empty()
											.append($(".fackey-" + indexi).text());
									$(".ui-selected", this).each(function() {
												var index = $(".fac-" + indexi + " li").index(this);
												result.append("#" + (index + 1));
												result2.append("," + (index + 1));
											});
								}
							});
				});


	$(document).ready(
			function() {
				$("#form-booking").submit(
						function(e) {
							e.preventDefault();
							var date = $(".datearea").text();
							var count = $("#count").val();
							var booknames = [];
							var bookslots = [];
							var hasdata = false;
							for (i = 0; i < count; i++) {
								booknames.push($(".fackey-" + i).text());
								if ($(".showarea-" + i).text() != "") {
									hasdata = true;
									bookslots.push($(".showarea-" + i).text());
								} else {
									bookslots.push("#0");
								}
							}
							;

							if (!hasdata) {
								toasterOptions();
								toastr.error("Please choose a slot to add!",
										"No Slot Selected");
							} else {
								$.post("addtocart", {
									'bookdate' : date,
									'count' : count,
									'bookfacnames' : JSON.stringify(booknames),
									'bookslots' : JSON.stringify(bookslots)
								}, function(data) {
									$('#mainpanel').html(data);
								});
							}
						});
			});

	$('.enabled').css('cursor', 'pointer');