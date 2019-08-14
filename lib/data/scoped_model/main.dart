import 'package:pt_project_1/data/scoped_model/Team_App_connected_models.dart';
import 'package:scoped_model/scoped_model.dart';
// scoped model=package to transfer data from parent widget to descendant widget
//scoped model=data will available to all widgets 
//scoped model descendant= data will available to specific widget
//Model with = implements mixins zote(MainModel contains mixins zote)
//models are created inorder to be able to access anything in the app
class MainModel extends Model with Team_AppConnectedModel,
Album_Model,
Category_Model,
Utility_Model,
User_Model{

}
