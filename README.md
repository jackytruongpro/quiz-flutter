# Quiz App en Flutter

Une application de quiz simple développée en utilisant Flutter. L'application propose une interface de quiz, récupérant les questions et les réponses depuis un fichier JSON stocké en ligne. Le score est calculé en temps réel pendant le quiz. Une fois toutes les questions répondues, l'application affiche le score total.

## Étapes d'Initialisation du Projet

1. **Création du Projet Flutter**
    ```bash
    flutter create quiz_app
    ```

2. **Ajout des Dépendances Nécessaires**
    - [http](https://pub.dev/packages/http) pour effectuer des requêtes et récupérer les questions depuis un fichier JSON distant.
    - [percent_indicator](https://pub.dev/packages/percent_indicator) pour afficher un pourcentage circulaire.
    - [confetti](https://pub.dev/packages/confetti) pour afficher des confettis lorsqu'on atteint 100% de bonnes réponses.
    - [connectivity](https://pub.dev/packages/connectivity) pour vérifier la connexion réseau.
    - [sqflite](https://pub.dev/packages/sqflite) pour créer une base de données locale.
    - [shared_preferences](https://pub.dev/packages/shared_preferences) pour stocker des données distantes dans la base de données locale.

    ```yaml
    dependencies:
      http: ^1.1.2
      percent_indicator: ^2.7.0
      confetti: ^0.7.0
      connectivity: ^4.3.2
      sqflite: ^2.0.0+4
      shared_preferences: ^2.0.8
    ```

4. **Création de la Structure de l'Application**
    - Création de pages pour l'accueil, le quiz, et les résultats.
    - Mise en place de la navigation entre ces pages (Navigator.push, Navigator.pushReplacement)

5. **Récupération des Questions depuis un Fichier JSON en Ligne**
    - Utilisation de la bibliothèque `http` pour récupérer les questions depuis un fichier JSON distant.

6. **Calcul du Score en Temps Réel**
    - Mise en place d'un mécanisme pour calculer le score pendant que l'utilisateur répond aux questions.

7. **Stockage des Données Localement avec SQFlite et SharedPreferences**
    - Utilisation de `sqflite` pour créer une base de données locale.
    - Utilisation de `shared_preferences` pour stocker des données distantes dans la base de données locale.

8. **Affichage du Score et Option de Rejouer**
    - Affichage du score total à la fin du quiz.
    - Option pour l'utilisateur de refaire le quiz.

9. **Utilisation de PercentIndicator et Confetti**
    - Utilisation de `percent_indicator` pour afficher un pourcentage circulaire sur la page des résultats.
    - Utilisation de `confetti` pour afficher des confettis lorsqu'on atteint 100% de bonnes réponses.

## Exécution de l'Application

Pour exécuter l'application, assurez-vous d'avoir Flutter installé localement. Utilisez la commande suivante dans le répertoire du projet après avoir bien lancé un simulateur et avoir sélectionné le device dans l'IDE :

```bash
flutter run
