<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.model.Konsumen" %>
<%@ page import="com.example.demo.repository.KonsumenRepository" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Daftar Konsumen</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Daftar Konsumen</h2>
    <form action="/list" method="get" class="mb-3">
        <div class="input-group">
            <div class="input-group-append">
                <a href="/form" class="btn btn-success">Tambah Konsumen</a>
            </div>
        </div>
    </form>
    <table id="konsumenTable" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nama</th>
            <th>Alamat</th>
            <th>Kota</th>
            <th>Provinsi</th>
            <th>Tanggal Registrasi</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>


<!-- DataTables JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/bootstrap.min.js"></script>
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap4.min.js"></script>


<script>
    $.ajax({
        type: "GET",
        url: "http://localhost:8080/api/konsumen",
        dataType: "json",
        success: function (data) {

            var tableBody = $("#konsumenTable tbody");
            tableBody.empty(); // Kosongkan tabel sebelum menambahkan data

            data.forEach(function (konsumen) {
                var row = "<tr>" +
                    "<td>" + konsumen.id + "</td>" +
                    "<td>" + konsumen.nama + "</td>" +
                    "<td>" + konsumen.alamat + "</td>" +
                    "<td>" + konsumen.kota + "</td>" +
                    "<td>" + konsumen.provinsi + "</td>" +
                    "<td>" + konsumen.tglRegistrasi + "</td>" +
                    "<td>" + konsumen.status + "</td>" +
                    "</tr>";
                tableBody.append(row);
            });

            // Inisialisasi DataTables setelah data ditambahkan
            $('#konsumenTable').DataTable();
        },
        error: function (error) {
            console.log("Error: ", error);
        }
    })

</script>
</body>
</html>
