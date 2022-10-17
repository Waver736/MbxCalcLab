using System;

namespace MbxCalcLab
{
    public class CalcSpace
    {
        //<summary>
        //Вычисление площади круга
        //</summary>
        //<param name="circleRadius">Радиус круга</param>
        public double CircleSpace(double circleRadius)
        {
            if (circleRadius <= 0)
                throw new Exception("Введено неверное значение радиуса круга, так как радиус не может быть меньше нуля или равен ему.");

            return Math.PI * circleRadius * circleRadius;
        }

        //<summary>
        //Вычисление площади треугольника
        //</summary>
        //<param name="firstSide">Первая сторона треугольника</param>
        //<param name="secondSide">Вторая сторона треугольника</param>
        //<param name="thirdSide">Третья сторона треугольника</param>
        public double TriangleSpace(double firstSide, double secondSide, double thirdSide)
        {
            if
            (
                firstSide <= 0
                || secondSide <= 0
                || thirdSide <= 0
            )
                throw new Exception("Введены неверные значения сторон треугольника, так как сторона не может быть меньше нуля или равна ему.");

            double semiperimeter = (firstSide + secondSide + thirdSide) / 2;
            return Math.Sqrt(semiperimeter * (semiperimeter - firstSide) * (semiperimeter - secondSide) * (semiperimeter - thirdSide));
        }

        //<summary>
        //Проверка на то, является ли треугольник прямоугольным
        //</summary>
        //<param name="firstSide">Первая сторона треугольника</param>
        //<param name="secondSide">Вторая сторона треугольника</param>
        //<param name="thirdSide">Третья сторона треугольника</param>
        public bool CheckRightAngledTriangle(double firstSide, double secondSide, double thirdSide)
        {
            if
            (
                firstSide <= 0
                || secondSide <= 0
                || thirdSide <= 0
            )
                throw new Exception("Введены неверные значения сторон треугольника, так как сторона не может быть меньше нуля или равна ему");

            if
            (
                firstSide * firstSide + secondSide * secondSide == thirdSide * thirdSide
                || firstSide * firstSide + thirdSide * thirdSide == secondSide * secondSide
                || secondSide * secondSide + thirdSide * thirdSide == firstSide * firstSide
            )
                return true;
            else
                return false;
        }
    }
}
