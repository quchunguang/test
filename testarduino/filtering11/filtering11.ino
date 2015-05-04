// 卡尔曼滤波
#include <Wire.h> // I2C library, gyroscope

// Accelerometer ADXL345
#define ACC (0x53)    //ADXL345 ACC address
#define A_TO_READ (6)        //num of bytes we are going to read each time (two bytes for each axis)

// Gyroscope ITG3200
#define GYRO 0x68 // gyro address, binary = 11101000 when AD0 is connected to Vcc (see schematics of your breakout board)
#define G_SMPLRT_DIV 0x15
#define G_DLPF_FS 0x16
#define G_INT_CFG 0x17
#define G_PWR_MGM 0x3E
#define G_TO_READ 8 // 2 bytes for each axis x, y, z

// offsets are chip specific.
int a_offx = 0;
int a_offy = 0;
int a_offz = 0;
int g_offx = 0;
int g_offy = 0;
int g_offz = 0;

char str[512];

void initAcc() {
    //Turning on the ADXL345
    writeTo(ACC, 0x2D, 0);
    writeTo(ACC, 0x2D, 16);
    writeTo(ACC, 0x2D, 8);
    //by default the device is in +-2g range reading
}

void getAccelerometerData(int* result) {
    int regAddress = 0x32;    //first axis-acceleration-data register on the ADXL345
    byte buff[A_TO_READ];

    readFrom(ACC, regAddress, A_TO_READ, buff); //read the acceleration data from the ADXL345

    //each axis reading comes in 10 bit resolution, ie 2 bytes.  Least Significat Byte first!!
    //thus we are converting both bytes in to one int
    result[0] = (((int)buff[1]) << 8) | buff[0] + a_offx;
    result[1] = (((int)buff[3]) << 8) | buff[2] + a_offy;
    result[2] = (((int)buff[5]) << 8) | buff[4] + a_offz;
}

//initializes the gyroscope
void initGyro()
{
    /*****************************************
    * ITG 3200
    * power management set to:
    * clock select = internal oscillator
    *     no reset, no sleep mode
    *   no standby mode
    * sample rate to = 125Hz
    * parameter to +/- 2000 degrees/sec
    * low pass filter = 5Hz
    * no interrupt
    ******************************************/
    writeTo(GYRO, G_PWR_MGM, 0x00);
    writeTo(GYRO, G_SMPLRT_DIV, 0x07); // EB, 50, 80, 7F, DE, 23, 20, FF
    writeTo(GYRO, G_DLPF_FS, 0x1E); // +/- 2000 dgrs/sec, 1KHz, 1E, 19
    writeTo(GYRO, G_INT_CFG, 0x00);
}

void getGyroscopeData(int * result)
{
    /**************************************
    Gyro ITG-3200 I2C
    registers:
    temp MSB = 1B, temp LSB = 1C
    x axis MSB = 1D, x axis LSB = 1E
    y axis MSB = 1F, y axis LSB = 20
    z axis MSB = 21, z axis LSB = 22
    *************************************/
    int regAddress = 0x1B;
    int temp, x, y, z;
    byte buff[G_TO_READ];

    readFrom(GYRO, regAddress, G_TO_READ, buff); //read the gyro data from the ITG3200

    result[0] = ((buff[2] << 8) | buff[3]) + g_offx;
    result[1] = ((buff[4] << 8) | buff[5]) + g_offy;
    result[2] = ((buff[6] << 8) | buff[7]) + g_offz;
    result[3] = (buff[0] << 8) | buff[1]; // temperature
}

float xz = 0, yx = 0, yz = 0;
float p_xz = 1, p_yx = 1, p_yz = 1;
float q_xz = 0.0025, q_yx = 0.0025, q_yz = 0.0025;
float k_xz = 0, k_yx = 0, k_yz = 0;
float r_xz = 0.25, r_yx = 0.25, r_yz = 0.25;
//int acc_temp[3];
//float acc[3];
int acc[3];
int gyro[4];
float Axz;
float Ayx;
float Ayz;
float t = 0.025;

void calculate_xz()
{

    xz = xz + t * gyro[1];
    p_xz = p_xz + q_xz;
    k_xz = p_xz / (p_xz + r_xz);
    xz = xz + k_xz * (Axz - xz);
    p_xz = (1 - k_xz) * p_xz;
}

void calculate_yx()
{

    yx = yx + t * gyro[2];
    p_yx = p_yx + q_yx;
    k_yx = p_yx / (p_yx + r_yx);
    yx = yx + k_yx * (Ayx - yx);
    p_yx = (1 - k_yx) * p_yx;

}

void calculate_yz()
{
    yz = yz + t * gyro[0];
    p_yz = p_yz + q_yz;
    k_yz = p_yz / (p_yz + r_yz);
    yz = yz + k_yz * (Ayz - yz);
    p_yz = (1 - k_yz) * p_yz;

}

//Writes val to address register on ACC
void writeTo(int DEVICE, byte address, byte val) {
    Wire.beginTransmission(DEVICE); //start transmission to ACC
    Wire.write(address);        // send register address
    Wire.write(val);        // send value to write
    Wire.endTransmission(); //end transmission
}

//reads num bytes starting from address register on ACC in to buff array
void readFrom(int DEVICE, byte address, int num, byte buff[]) {
    Wire.beginTransmission(DEVICE); //start transmission to ACC
    Wire.write(address);        //sends address to read from
    Wire.endTransmission(); //end transmission

    Wire.beginTransmission(DEVICE); //start transmission to ACC
    Wire.requestFrom(DEVICE, num);    // request 6 bytes from ACC

    int i = 0;
    while (Wire.available())   //ACC may send less than requested (abnormal)
    {
        buff[i] = Wire.read(); // receive a byte
        i++;
    }
    Wire.endTransmission(); //end transmission
}

void setup()
{
    Serial.begin(9600);
    Wire.begin();
    initAcc();
    initGyro();

}

//unsigned long timer = 0;
//float o;
void loop()
{
    getAccelerometerData(acc);
    getGyroscopeData(gyro);
    //timer = millis();
    sprintf(str, "%d,%d,%d,%d,%d,%d", acc[0], acc[1], acc[2], gyro[0], gyro[1], gyro[2]);

    //acc[0]=acc[0];
    //acc[2]=acc[2];
    //acc[1]=acc[1];
    //r=sqrt(acc[0]*acc[0]+acc[1]*acc[1]+acc[2]*acc[2]);
    gyro[0] = gyro[0] / 14.375;
    gyro[1] = gyro[1] / (-14.375);
    gyro[2] = gyro[2] / 14.375;

    Axz = (atan2(acc[0], acc[2])) * 180 / PI;
    Ayx = (atan2(acc[0], acc[1])) * 180 / PI;
    /*if((acc[0]!=0)&&(acc[1]!=0))
      {
        Ayx=(atan2(acc[0],acc[1]))*180/PI;
      }
      else
      {
        Ayx=t*gyro[2];
      }*/
    Ayz = (atan2(acc[1], acc[2])) * 180 / PI;

    //kalman filter
    calculate_xz();
    calculate_yx();
    calculate_yz();

    //sprintf(str, "%d,%d,%d", xz_1, xy_1, x_1);
    //Serial.print(xz);Serial.print(",");
    //Serial.print(yx);Serial.print(",");
    //Serial.print(yz);Serial.print(",");
    //sprintf(str, "%d,%d,%d,%d,%d,%d", acc[0],acc[1],acc[2],gyro[0],gyro[1],gyro[2]);
    //sprintf(str, "%d,%d,%d",gyro[0],gyro[1],gyro[2]);
    Serial.print(Axz); Serial.print(",");
    //Serial.print(Ayx);Serial.print(",");
    //Serial.print(Ayz);Serial.print(",");
    //Serial.print(str);
    //o=gyro[2];//w=acc[2];
    //Serial.print(o);Serial.print(",");
    //Serial.print(w);Serial.print(",");
    Serial.print("\n");

    //delay(50);
}
