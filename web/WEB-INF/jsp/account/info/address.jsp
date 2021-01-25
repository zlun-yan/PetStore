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

    <form method="post" accept-charset="UTF-8" id="address-form">
        <div class="form-group mb-3">
            <div class="form-group-header">
                <label for="address_details">Details</label>
            </div>
            <div class="form-group-body">
                <textarea class="form-control" id="address_details" style="width: 530px"
                          placeholder="Please input detailed address information, such as road, house number, residential area, building number, unit, etc"></textarea>
            </div>
        </div>

        <div class="mb-3">
            <label name="receiver[name]" for="receiver_name" style="display: inline-block;width: 130px">Receiver name:</label>
            <input class="form-control" type="text" style="display: inline-block;width: 400px"
                   placeholder="No more than 25 characters in length" id="receiver_name"/>

        </div>

        <div class="mb-3">
            <label name="receiver[phone]" for="receiver_phone" style="display: inline-block;width: 130px">Receiver phone:</label>
            <input class="form-control" type="text" style="display: inline-block;width: 400px"
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

<script src="static/js/account/address.js"></script>
