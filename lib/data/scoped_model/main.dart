import 'package:pt_project_1/data/scoped_model/Team_App_connected_models.dart';
import 'package:scoped_model/scoped_model.dart';
// scoped model=package to transfer data from parent widget(all widgets) to descendant widget(specific widget)
//'Model with' = implements mixins zote(MainModel contains all mixins)
//models are created inorder to be able to access anything in the app
class MainModel extends Model with Team_AppConnectedModel,
Album_Model,
Category_Model,
Utility_Model,
User_Model{

}
