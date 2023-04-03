# Paquete auto_route

### 1. Agregar dependencias

```
dependencies:                    
  auto_route: [latest-version]                    
                    
dev_dependencies:                    
  auto_route_generator: [latest-version]                    
  build_runner:     
```

* Siempre intentear tener control sobre las versiones de paquetes que agregamos al proyecto. Hay ocasiones que existe dependencia de paquetes y es util saber las versions de cada uno.


### 2. Crear clase router

```
    import 'package:auto_route/auto_route.dart';
    
    @AutoRouterConfig()
    class AppRouter extends $AppRouter {
      RouteType get defaultRouteType => RouteType.material();
    
      @override
      final List<AutoRoute> routes = [
        /// routes go here
      ];
    }

```


### 3. Generar clases con build_runner
  
  Ejectar comando, esto genera una clase con extension gr.dart
```
 flutter packages pub run build_runner build  
```


### 4. Importar en la clase del router el archivo generado por el builrunner


```
    import 'package:auto_route/auto_route.dart';
    import 'package:notas/routes/routes.gr.dart';
    
    @AutoRouterConfig()
    class AppRouter extends $AppRouter {
      RouteType get defaultRouteType => RouteType.material();
    
      @override
      final List<AutoRoute> routes = [
        /// routes go here
      ];
    }

```

### 5. Anotar las pages con la anotación @RoutePage()

```
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Home page")),
    );
  }
}

```


### 6. Agregar la clase router al widget raiz (al que contiene el material app).
1. instanciar la clase del router
2. Usar el constructor nombrado MaterialApp.router( routerConfig: )
3. pasar la instancia del paso 1 al constructor al parametro routerConfig. usar el método config() de la instancia.

```
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App de notas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}

```


### 7. Volver a ejecutar el builrunner, para que se generen los clases ".page" en el archivo ".gr.dart"

!nota: o podemos primero marcar las pages con la notación @RoutePage() y al final recion ejecutar el comando del buidrunner. 

### 8. Agregar las pages generadas en la clase del router


* la routa inicial va con el path "/"

```
import 'package:auto_route/auto_route.dart';
import 'package:notas/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: "/"),
    AutoRoute(page: DetailRoute.page, path: "/detail")
  ];
}

```



### 9. Como navegar a otra pagina

* tenemos dos opciones:
    1. Usar rutas con nombres
    2. usar clases
    
#### 9.1. Rutas con nombres
Es neceario que las rutas en la clase router tengan defindo su nombre

```
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: "/"),
    AutoRoute(page: DetailRoute.page, path: "/detail")
  ];
}
````

Dentro de algun botón usamos el metodo pushNamed para naveagar hacia una ruta con nobmre

```
    onPressed: () {
      // AutoRouter.of(context).push(DetailRoute());
      AutoRouter.of(context).pushNamed("/detail");
    },
```

#### 9.2. Usar la clase
En este caso vamos a usar una clase generada por AutoRoute correspondiente a cada página. Generalmente termina con Route. En mi caso, tengo definido una vista llamada DetailPage, y en correlación a ella, tengo la clase autogenerada llamada DetailRoute (Estas clases se encuentra en el archivo generado por builrunner que termina con .gr.dart)

Para navegar hacia ella sin usar el nombre, simplemente uso la clase que termna con Route

```
    onPressed: () {
      AutoRouter.of(context).push(DetailRoute());
      // AutoRouter.of(context).pushNamed("/detail");
    },
```

