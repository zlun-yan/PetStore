<%--
  Created by IntelliJ IDEA.
  User: ZlunYan
  Date: 2021/1/25
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>

<div class="box-shadow-extra-large p-3">
    <strong>Delivery address</strong>
</div>

<div>
    <div class="text-red my-3">
        New delivery address
    </div>

    <div class="mb-3" id="errorBox" style="display: none">
        <div class="flash flash-full flash-error" style="border-width: 1px; border-radius: 6px">
            <div class="container-lg px-2" >
                <button class="flash-close js-flash-close" type="button" aria-label="Dismiss this message" id="error_button">
                    <svg class="octicon octicon-x" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true">
                        <path fill-rule="evenodd" d="M3.72 3.72a.75.75 0 011.06 0L8 6.94l3.22-3.22a.75.75 0 111.06 1.06L9.06 8l3.22 3.22a.75.75 0 11-1.06 1.06L8 9.06l-3.22 3.22a.75.75 0 01-1.06-1.06L6.94 8 3.72 4.78a.75.75 0 010-1.06z"></path>
                    </svg>
                </button>
                <p id="info">
                    Error
                </p>
            </div>
        </div>
    </div>

    <div class="mb-3">

    </div>

    <form method="post" accept-charset="UTF-8" id="address-form">
        <div class="form-group mb-3">
            <div class="form-group-header">
                <label for="address_info">Address information</label>
            </div>
            <div class="form-group-body" id="address_info">
                <select class="form-select mr-3" style="width: 179px" id="address_province">
                    <option disabled selected id="placeHolder">Province</option>
                </select>

                <select class="form-select mr-3" style="width: 179px" id="address_city" disabled="disabled">
                    <option disabled selected>City</option>
                </select>

                <select class="form-select mr-3" style="width: 179px" id="address_district" disabled="disabled">
                    <option disabled selected>District</option>
                </select>
            </div>
        </div>
        <div class="form-group mb-3">
            <div class="form-group-header">
                <label for="address_details">Details</label>
            </div>
            <div class="form-group-body">
                <textarea class="form-control" id="address_details" style="width: 577px"
                          placeholder="Please input detailed address information, such as road, house number, residential area, building number, unit, etc"></textarea>
            </div>
        </div>

        <div class="mb-3">
            <label name="receiver[name]" for="receiver_name" style="display: inline-block;width: 130px">Receiver name:</label>
            <input class="form-control" type="text" style="display: inline-block;width: 447px"
                   placeholder="No more than 25 characters in length" id="receiver_name"/>

        </div>

        <div class="mb-3">
            <label name="receiver[phone]" for="receiver_phone" style="display: inline-block;width: 130px">Receiver phone:</label>
            <input class="form-control" type="text" style="display: inline-block;width: 447px"
                   placeholder="No more than 25 characters in length" id="receiver_phone"/>
        </div>

        <div class="mb-3">
            <input type="checkbox" id="address_default">
            <label name="address[default]" for="address_default">As default delivery address</label>
        </div>

        <div class="mb-3">
            <input type="submit" value="Save" class="btn btn-primary" id="submitButton">
        </div>
    </form>
</div>

<script type="module" src="static/js/account/info/address.js"></script>
