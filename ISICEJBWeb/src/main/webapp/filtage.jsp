<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Hôtels par Ville</title>

    <!-- Inclure les fichiers CSS de Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        body {
            background-color: #5585b5;
        }

        .container {
            margin-top: 100px;
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
            color: black;
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
            margin-top: 20px; /* Ajustez la marge supérieure selon vos préférences */
        }
    </style>
</head>

<body>
    <jsp:include page="navbar.jsp" />
    
   <div class="container">
    
    <div class="row justify-content-center">
        <div class="col-md-6 form-container">
            <div class="title-container">
            <div class="title-icon">
                
            </div>
                <h2 class="text-center mb-4">Hôtels par ville</h2>
            </div>

        
    <form action="FiltrageController" method="post" class="mb-4">
    <div class="form-group">
        <select name="selectedCity" class="form-control" required>
            <option value="tt">Choisir une ville</option>
            <c:forEach items="${villes}" var="ville">
                <option value="${ville.id}">${ville.nom} : ${ville.id}</option>
            </c:forEach>
        </select>
    </div>
    <div class="d-flex justify-content-center">
    <button type="submit" class="btn btn-primary">Chercher</button>
    </div>
</form>


            <hr>

            <h3>Résultats :</h3>
            <c:if test="${not empty hotels}">
                <ul class="list-group">
                    <c:forEach items="${hotels}" var="hotel">
                        <li class="list-group-item">${hotel.nom} - ${hotel.adresse}</li>
                    </c:forEach>
                </ul>
            </c:if>
            
          
            
        </div>
        
    </div>

  

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
 
</body>
</html>