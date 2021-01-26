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
        if (name == "") {
            $("#errorBox").show();
            $("#info").text("Please enter the receiver`s name");
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
})