import DISTRICTS from '../../common/districts.js'

let DEFAULT_CODE = 100000;
let PROVINCE = 'province';
let CITY = 'city';
let DISTRICT = 'district';

$(document).ready(function () {
    var option = DISTRICTS[DEFAULT_CODE];
    var provinceSelecter = $("select#address_province");
    var citySelecter = $("select#address_city");
    var districtSelecter = $("select#address_district");

    for (var code in option) {
        var newItem = $('<option value="'+ code +'">' + option[code] + '</option>');
        provinceSelecter.append(newItem);
    }

    provinceSelecter.on("change", function () {
        $("#errorBox").hide();
        $("option#placeHolder").remove();

        PROVINCE = option[$(this).val()];
        DEFAULT_CODE = $(this).val();

        citySelecter.attr("disabled", false);
        citySelecter.empty();

        option = DISTRICTS[DEFAULT_CODE];
        for (var code in option) {
            var newItem = $('<option value="'+ code +'">' + option[code] + '</option>');
            citySelecter.append(newItem);
        }

        districtSelecter.attr("disabled",false);
        districtSelecter.empty();

        CITY = option[citySelecter.val()];
        DEFAULT_CODE = citySelecter.val();

        option = DISTRICTS[DEFAULT_CODE];
        for (var code in option) {
            var newItem = $('<option value="'+ code +'">' + option[code] + '</option>');
            districtSelecter.append(newItem);
        }

        DISTRICT = option[districtSelecter.val()];
        DEFAULT_CODE = districtSelecter.val();
    })

    citySelecter.on("change", function () {
        $("#errorBox").hide();
        CITY = option[$(this).val()];
        DEFAULT_CODE = $(this).val();

        districtSelecter.attr("disabled", false);
        districtSelecter.empty();

        option = DISTRICTS[DEFAULT_CODE];
        for (var code in option) {
            var newItem = $('<option value="'+ code +'">' + option[code] + '</option>');
            districtSelecter.append(newItem);
        }
    })

    districtSelecter.on("change", function () {
        $("#errorBox").hide();
        DISTRICT = option[$(this).val()];
        DEFAULT_CODE = $(this).val();
    })

    $("textarea#address_details").bind("input propertychange", function () {
        $("#errorBox").hide();
    })

    $("input#receiver_name").bind("input propertychange", function () {
        $("#errorBox").hide();
    })

    $("input#receiver_phone").bind("input propertychange", function () {
        $("#errorBox").hide();
    })

    $("#address-form").on("submit", function (e) {
        e.preventDefault();

        if (PROVINCE == 'province') {
            $("#errorBox").show();
            $("#info").text("Please pick the delivery address");
            $("#address_province").focus();
            return;
        }

        var details = $("textarea#address_details").val();
        if (details == "") {
            $("#errorBox").show();
            $("#info").text("Please enter the details of the delivery address");
            $("textarea#address_details").focus();
            return;
        }

        var name = $("input#receiver_name").val();
        console.log(name.length);
        console.log(name.length > 15 || name.length < 2)
        if (name == "") {
            $("#errorBox").show();
            $("#info").text("Please enter the receiver`s name");
            $("input#receiver_name").focus();
            return;
        }
        if (name.length > 15 || name.length < 2) {
            $("#errorBox").show();
            $("#info").text("The length of the receiver's name should be between 2-25 Chinese characters");
            $("input#receiver_name").focus();
            return;
        }

        var phone = $("input#receiver_phone").val();
        if (phone == "") {
            $("#errorBox").show();
            $("#info").text("Please enter the receiver`s phone number");
            $("input#receiver_phone").focus();
            return;
        }
        if (phone.length != 11) {
            $("#errorBox").show();
            $("#info").text("Please input 11 digit mobile phone number");
            $("input#receiver_phone").focus();
            return;
        }

        var defaultAddr = $("input#address_default").is(':checked');
        console.log(defaultAddr);

        $.ajax({
            type: "POST",
            dataType: "json",
            url: "addressForm",
            timeout: 2000,
            data: {
                province: PROVINCE,
                city: CITY,
                district: DISTRICT,
                address_code: DEFAULT_CODE,
                details: details,
                name: name,
                phone: phone,
                defaultAddr: defaultAddr
            },
            beforeSend: function() {
                $("#submitButton").attr("value", "Saving...").attr("disabled", "true");
            },
            success: function (data) {
                var state = data["state"];
                if (state == "success") {
                    window.location.reload();
                }
                else if (state == "fail") {
                    $("#info").text("Error, please try again.");
                    $("#errorBox").show();
                    $("#submitButton").attr("value", "Save").removeAttr("disabled");
                }
            },
            error : function() {
                $("#info").text("Error, please try again.");
                $("#errorBox").show();
                $("#submitButton").attr("value", "Save").removeAttr("disabled");
            }
        });
    })

    $("#error_button").on("click", function () {
        $("#errorBox").hide();
    })

    $("#list_error_button").on("click", function () {
        $("#listErrorBox").hide();
    })
    list_error_button

    $("table button").on("click", function () {
        var id = $(this).attr("id");
        id = id.split("_");

        if (id[0] == "default") {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "defaultAddr",
                timeout: 2000,
                data: {
                    addressId: id[1]
                },
                beforeSend: function() {
                    $(this).attr("value", "Setting...").attr("disabled", "true");
                },
                success: function (data) {
                    var state = data["state"];
                    if (state == "success") {
                        window.location.reload();
                    }
                    else if (state == "fail") {
                        $("#listInfo").text("Error, please try again.");
                        $("#listErrorBox").show();
                        $(this).attr("value", "Set as default").removeAttr("disabled");
                    }
                },
                error : function() {
                    $("#listInfo").text("Error, please try again.");
                    $("#listErrorBox").show();
                    $(this).attr("value", "Set as default").removeAttr("disabled");
                }
            });
        }
        else if (id[0] == "change") {
            console.log("split change " + id[1]);
        }
        else if (id[0] == "delete") {
            console.log("split delete " + id[1]);
        }
    })


    var empty = parseInt($("#zlun-js-address-empty").val());

    if (empty != 0) {
        $(".zlun-js-address-delete").on("click", function () {
            var id = this.id;
            id = id.split("_");
            id = id[1];

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "deleteAddress",
                timeout: 2000,
                data: {
                    addressId: id
                },
                success: function () {
                    $("#item_" + id).remove();
                    empty--;
                    if (empty == 0) {
                        $("#zlun-js-address-body").empty();
                        $("#zlun-js-address-body").append($('<div class="blankslate">\n' +
                            '                <svg class="octicon octicon-octoface blankslate-icon" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M7.75 11c-.69 0-1.25.56-1.25 1.25v1.5a1.25 1.25 0 102.5 0v-1.5C9 11.56 8.44 11 7.75 11zm1.27 4.5a.469.469 0 01.48-.5h5a.47.47 0 01.48.5c-.116 1.316-.759 2.5-2.98 2.5s-2.864-1.184-2.98-2.5zm7.23-4.5c-.69 0-1.25.56-1.25 1.25v1.5a1.25 1.25 0 102.5 0v-1.5c0-.69-.56-1.25-1.25-1.25z"></path><path fill-rule="evenodd" d="M21.255 3.82a1.725 1.725 0 00-2.141-1.195c-.557.16-1.406.44-2.264.866-.78.386-1.647.93-2.293 1.677A18.442 18.442 0 0012 5c-.93 0-1.784.059-2.569.17-.645-.74-1.505-1.28-2.28-1.664a13.876 13.876 0 00-2.265-.866 1.725 1.725 0 00-2.141 1.196 23.645 23.645 0 00-.69 3.292c-.125.97-.191 2.07-.066 3.112C1.254 11.882 1 13.734 1 15.527 1 19.915 3.13 23 12 23c8.87 0 11-3.053 11-7.473 0-1.794-.255-3.647-.99-5.29.127-1.046.06-2.15-.066-3.125a23.652 23.652 0 00-.689-3.292zM20.5 14c.5 3.5-1.5 6.5-8.5 6.5s-9-3-8.5-6.5c.583-4 3-6 8.5-6s7.928 2 8.5 6z"></path></svg>\n' +
                            '                <h3>You don’t seem to save any delivery address.</h3>\n' +
                            '                <p>Saving an address makes it easier to buy.</p>\n' +
                            '            </div>'));
                    }
                }
            });
        })
    }
})