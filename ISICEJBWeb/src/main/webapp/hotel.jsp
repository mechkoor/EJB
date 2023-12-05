<%@page import="entities.Ville"%>
<%@page import="entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Gestion des H�tels</title>

    <!-- Inclure les fichiers CSS de Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

    <!-- Inclure les fichiers CSS des ic�nes de Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        /* Votre propre style CSS peut �tre ajout� ici */

        body {
            background-color: #5585b5;
        }

        .container {
            margin-top: 50px;
        }

        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color:black; 
        }

        .form-control {
            color: black;
        }

        .btn-enregistrer {
            background-color: #5585b5;
            
            width: 200px;
            color: #ffffff;
        }

        .title-container {
            display: flex;
             color:#2d4059;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
        }

        .title-icon {
             font-size: 100px; 
             margin-right: 10px;
        }

        /* Ajouter une classe pour ajuster le style du tableau */
        .table-responsive-custom {
            overflow-x: auto;
            margin-top: 20px; /* Ajustez la marge sup�rieure selon vos pr�f�rences */
        }
    </style>
</head>
<script>
    function setModalValues(hotelId, hotelNom,hotelAdresse,hotelTelephone) {
        document.getElementById('modalHotelId').value = hotelId;
        document.getElementById('modalHotelNom').value = hotelNom;
        document.getElementById('modalHotelAdresse').value = hotelAdresse;
        document.getElementById('modalHotelTelephone').value = hotelTelephone;
    }
</script>

<body>
<jsp:include page="navbar.jsp" />
<div class="container">
    
    <div class="row justify-content-center">
        <div class="col-md-6 form-container">
            <div class="title-container">
            <div class="title-icon">
               
            </div>
                <h2 class="text-center mb-4">Gestion des Hotels</h2>
            </div>

            <form action="HotelController" method="post">
              
                <div class="form-group">
                    <label for="nom">Nom :</label>
                    <input  name="nom" type="text" class="form-control" id="nom" placeholder="Entrez votre nom">
                </div>

                <div class="form-group">
                    <label for="adresse">Adresse :</label>
                    <input name="adresse" type="text" class="form-control" id="adresse" placeholder="Entrez votre adresse">
                </div>

                <div class="form-group">
                    <label for="telephone">Telephone :</label>
                    <input name="telephone" type="tel" class="form-control" id="telephone" placeholder="Entrez votre numero de telephone">
                </div>
                <div class="form-group">
                <select name="ville" class="form-control" required>
            	<option value="tt">Choisir une ville</option>
	            <c:forEach items="${villes}" var="ville">
	            	<option value="${ville.id}" >${ville.nom}</option>
	            </c:forEach>
	            </select>
	            </div>
	            <div class="d-flex justify-content-center">

                <button type="submit"  name="action" value="create"  class="btn btn-primary">Enregistrer</button>
           </div>
            </form>

      
            <div class="table-responsive table-responsive-custom">
                <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Adresse</th>
                    <th>Telephone</th>
                    <th>Ville</th>
                    <th>Suprimer</th>
                    <th>Modifier</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${hotels}" var="hotel">
                    <tr>
                    <td>${hotel.id}</td>
                    <td>${hotel.nom}</td>
                    <td>${hotel.adresse}</td>
                    <td>${hotel.telephone}</td>
                    <td>${hotel.ville.nom}</td>
                    <td>
                    <form action="HotelController" method="post">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${hotel.id}">
                                <button type="submit" class="btn btn-danger">Supprimer</button>
                    </form>
                    
                    </td>
                    <td>
                   <button type="button" class="btn btn-primary ml-2" data-toggle="modal" data-target="#ModifyHotelModal"
                                     onclick="setModalValues(${hotel.id}, '${hotel.nom}','${hotel.adresse}','${hotel.telephone}')">
                               Modifier
                   </button>
                    </td>
                    </tr>
                </c:forEach>
             </tbody>
     </table>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ModifyHotelModal" tabindex="-1" role="dialog" aria-labelledby="ModifyHotelModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="HotelController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModifyHotelModalCenterTitle">Modifier un Hotel</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="Name">Nom du Hotel</label>
                            <input type="text" name="Name" id="modalHotelNom" class="form-control" required>
                            <label class="custom-modal-label" for="Adresse">Adresse du hotel</label>
                            <input type="text" name="Adresse" id="modalHotelAdresse" class="form-control" required>
                            <label class="custom-modal-label" for="Telephone">Telephone du hotel</label>
                            <input type="text" name="Telephone" id="modalHotelTelephone" class="form-control" required>
                            
                            
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" id="modalHotelId">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                            <input type="submit" class="btn btn-primary" value="Enregistrer les modifications">
                        </div>
                    </div>
                </form>
            </div>
        </div>
</div>

<!-- ... Vos scripts JavaScript Bootstrap ... -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous">
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous">
</script>        
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous">
</script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>