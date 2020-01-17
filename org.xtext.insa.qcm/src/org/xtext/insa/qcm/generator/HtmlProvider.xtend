package org.xtext.insa.qcm.generator

import qcm.Qcm
import qcm.Question
import qcm.Reponse

class HtmlProvider {

	def String getHome(String domaines) {
		return '<html lang="en">
		<head>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
			<style>
				body {
				  padding-top: 5rem;
				}
				.starter-template {
				  padding: 3rem 1.5rem;
				  text-align: center;
				}
			</style>
		</head>
		<body>
			<div class="container">
				<h1 class="h3 mb-3 font-weight-normal">Bienvenue</h1>
					<form>
					<p>Choisir un domaine:</p>
					<select class="form-control form-control-lg">'
					+ 
					domaines
					+ 
					'</select>
					<br>
					<p>Choisir la mode:</p>
					<select class="form-control form-control-lg">
						<option>Exercice</option>
						<option>Examen</option>
					</select>
					<br><br>
					<button style="width: 20%;" class="btn btn-lg btn-primary btn-block" type="submit">Commencer</button>
					<br>
					<p class="mt-5 mb-3 text-muted">&copy; 2020</p>
				</form>
			</div>
		</body>
		</html>'
	}
	
	def String getQcm(Qcm qcm) {
		var str = '<!doctype html>
					<html lang="en">
					<head>
						<meta charset="utf-8">
						<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
						<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
						<style>
							body {
							  padding-top: 5rem;
							}
							.starter-template {
							  padding: 3rem 1.5rem;
							  text-align: center;
							}
						</style>
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
						<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
					</head>
					<body>
						<div class="container">
							<h1 class="h3 mb-3 font-weight-normal">QCM</h1>
	 				<form>'
	 	
	 	val questions = qcm.eAllContents()
	 	
	 	for(Question q : questions.toIterable.filter(typeof(Question))) {
	 		str += '<p>' + q.data + '</p>'
	 		
	 		val reponses = q.eAllContents();
	 		for(Reponse r : reponses.toIterable.filter(typeof(Reponse))) {
	 			str += '<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="' + q.data + '" id="' + q.data + '" value="' + r.data + '">'
				str += '<label class="form-check-label" for="' + q.data + '">' + r.data + '</label>'
	 		}
	 	} 
	 	
	 	str += '
			<br><button class="btn btn-primary" type="submit">Envoyer</button>
					<form>
				</div>
			</body>
			</html>' 
		
		
		return str
	}
	
	def String getReponses(Qcm qcm) {
		var str = '<!doctype html>
					<html lang="en">
					<head>
						<meta charset="utf-8">
						<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
						<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
						<style>
							body {
							  padding-top: 5rem;
							}
							.starter-template {
							  padding: 3rem 1.5rem;
							  text-align: center;
							}
						</style>
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
						<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
					</head>
					<body>
						<div class="container">
							<h1 class="h3 mb-3 font-weight-normal">Réponses</h1>'
	 	
	 	val questions = qcm.eAllContents()
	 	
	 	for(Question q : questions.toIterable.filter(typeof(Question))) {
	 		str += '<p>' + q.data + '</p>'
	 		
	 		val reponses = q.eAllContents();
	 		for(Reponse r : reponses.toIterable.filter(typeof(Reponse))) {
	 			str += '<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="' + q.data + '" id="' + q.data + '" value="' + r.data
				
				if(r.valeur) {
					str += '" checked>'
				} else {
					str += '">'
				}
				
				str += '<label class="form-check-label" for="' + q.data + '">' + r.data + '</label>'
				
				
				if(r.valeur) {
					str += '<p style="color: green">Bonne réponse</p>'
				}
	 		}
	 	} 
	 	
	 	str += '
			<br><button type="button" class="btn btn-primary" onclick="window.location.href = \'fin.html\';">Quitter</button>
				</div>
			</body>
			</html>' 
		
		
		return str
	}
	
	def String getFin(Boolean succeded) {
		
		var str = '<!doctype html>
					<html lang="en">
					<head>
						<meta charset="utf-8">
						<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
						<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
						<style>
							body {
							  padding-top: 5rem;
							}
							.starter-template {
							  padding: 3rem 1.5rem;
							  text-align: center;
							}
						</style>
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
						<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
					</head>
					<body>
						<div class="container text-center">'
		
		if(succeded) {
			str += '<p>Tu as réussi ton test!</p>'
		} else {
			str += '<p>Malheureusement tu as pas réussi le QCM, Bonne chance la prochaine fois!</p>'
		}
		
		str += '<h1>Bye!</h1>
				</div>
			</body>
			</html>'
			
		return str
	}
}
