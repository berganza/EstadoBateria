//
//  ViewController.m
//  ComprobarBateria
//
//  Created by LLBER on 14/08/13.
//  Copyright (c) 2013 Berganza. All rights reserved.
//




        /*********************************
        // Probar en un dispositivo real
        *********************************/

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize texto;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    texto = [[UITextView alloc] init];
    texto.editable = NO;
    texto.frame = CGRectMake(0, 50, CGRectGetMaxX(self.view.bounds), CGRectGetMaxY(self.view.bounds));
    
    texto.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    texto.backgroundColor = [UIColor darkGrayColor];
    texto.textColor = [UIColor whiteColor];
    texto.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:texto];
    
    UIBarButtonItem* boton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                  target:self
                                                  action:@selector(refrescar)];
    self.navigationItem.rightBarButtonItem = boton;
    
    
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    [self refrescar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refrescar)
                                                 name:UIDeviceBatteryLevelDidChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refrescar)
                                                 name:UIDeviceBatteryStateDidChangeNotification
                                               object:nil];
}

- (void)refrescar {
    UIDevice* telefono = [UIDevice currentDevice];
    NSMutableString* mostrarTexto = [[NSMutableString alloc] initWithCapacity:1024];
    [mostrarTexto appendFormat:@"\n Estado de la batería: %@\n", [self estadoDeLaBateria:telefono.batteryState]];
    [mostrarTexto appendFormat:@"\n Nivel de la batería: %.2f\n", telefono.batteryLevel];
    texto.text = mostrarTexto;
}

- (NSString*)estadoDeLaBateria:(UIDeviceBatteryState)telefono {
    switch ( telefono ) {
        case UIDeviceBatteryStateUnplugged: return @"\n Desconectada";
        case UIDeviceBatteryStateCharging: return @"\n Cargando";
        case UIDeviceBatteryStateFull: return @"\n Al 100%";
        default: return @"\n Desconocido";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
