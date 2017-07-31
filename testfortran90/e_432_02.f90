PROGRAM Student_Records
IMPLICIT NONE
!-----------------------------------------------------------------------------------------
INTEGER, PARAMETER :: NameLen=20
!_________________________________________
TYPE StudentRecord
	CHARACTER(NameLen) :: Name
	INTEGER(1)         :: Score
END TYPE StudentRecord
!_________________________________________
TYPE(StudentRecord) :: Student
INTEGER(1)          :: EOF, RecLen, RecNo
LOGICAL             :: ThereIs
CHARACTER(NameLen)  :: FileName
CHARACTER           :: Ans*1, FileStatus*7
CHARACTER(*),PARAMETER :: NameChars=' abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
!-----------------------------------------------------------------------------------------
INQUIRE(IOLENGTH=RecLen) Student
WRITE(*,"('输入文件名＝')",ADVANCE='NO')
READ *, FileName
INQUIRE(FILE=FileName,EXIST=ThereIs)

IF(ThereIs) THEN
	WRITE(*,'(a)',ADVANCE='NO') '文件已存在，是否删除并重建(Y/N)＝'
	READ *, Ans
	IF(Ans=='Y'.or.Ans=='y') THEN
		FileStatus='REPLACE'
	ELSE
		FileStatus='OLD'
	END IF
ELSE
		FileStatus='NEW'
END IF

OPEN(1,FILE=FileName,STATUS=FileStatus,ACCESS='DIRECT',RECL=RecLen)
DO
	PRINT *
	PRINT *, "A: Add new records         加入记录"
	PRINT *, "D: Display all records     显示记录"
	PRINT *, "U: Update existing records 更新记录"
	PRINT *, "Q: Quit                    退出程序"
	PRINT *
	WRITE(*,'(a)',ADVANCE='NO') '请选择并按回车键＝'
	READ *, Ans
	SELECT CASE(Ans)
		CASE('A','a')
			CALL AddRecords
		CASE('D','d')
			CALL DisplayRecords
		CASE('U','u')
			CALL UpDate
		CASE('Q','q')
			EXIT
	END SELECT
END DO
CLOSE(1)

CONTAINS
!==================================================
SUBROUTINE AddRecords
	RecNo=0 ; EOF=0
	DO WHILE(EOF==0)
		READ(1,REC=RecNo+1,IOSTAT=EOF)
		IF(EOF==0) RecNo=RecNo+1
	END DO
	RecNo=RecNo+1
	Student=StudentRecord(' ',0)
	DO WHILE(VERIFY(Student%Name,NameChars)==0)    !验证输入姓名字符中是否含有除英文字母和空格之外的其它字符
		WRITE(*,'(a)',ADVANCE='NO') "输入英文姓名＝"
		READ *, Student%Name
		IF(VERIFY(Student%Name,NameChars)==0) THEN
			WRITE(*,'(a)',ADVANCE='NO') '输入分数＝'
			CALL ReadIntCon(Student%Score)
			WRITE(1,REC=RecNo) Student
			RecNo=RecNo+1
		END IF
	END DO
END SUBROUTINE AddRecords
!==================================================
SUBROUTINE ReadIntCon(Num)
	INTEGER(1) :: Err, Num   !如将下一语句合并在此作初始化Err=1的话，相当于自动设置了SAVE属性
	Err=1                    !则仅当第一次子程序被调用时有效。
	DO WHILE(Err>0)
		READ(*,*,IOSTAT=Err) Num
		IF(Err>0 .or. Num<0 .or. Num>100) PRINT *,'分数有误，重新键入＝'
	END DO
END SUBROUTINE ReadIntCon
!==================================================
SUBROUTINE DisplayRecords
	RecNo=1; EOF=0
	DO WHILE(EOF==0)
		READ(1,REC=RecNo,IOSTAT=EOF) Student
		IF(EOF==0) PRINT '(A20,I3)', Student
		RecNo=RecNo+1
	END DO
END SUBROUTINE DisplayRecords
!==================================================
SUBROUTINE UpDate
	CHARACTER(NameLen) :: Item, Copy
	LOGICAL :: Found                               !用来判定是否找到某个记录
	Found=.false.                                  !初始时必须假定没有找到
	EOF=0
	WRITE(*,'(a)',ADVANCE='NO') '更新谁?＝'
	READ *, Item                                   !Item有20个字节，因此需要将
	CALL StripBlanks(Item)                         !无效的空格删去后进行匹配查找
	RecNo=1
	DO WHILE(EOF==0.AND..NOT.Found)
		READ(1,IOSTAT=EOF,REC=RecNo) Student
		IF(EOF==0) THEN
			Copy=Student%Name
			CALL StripBlanks(Copy)
			IF(Item==Copy) THEN
				Found=.true.
				WRITE(*,'(2(a,i3),a)',ADVANCE='NO') '找到记录号为＝',&
					 RecNo, '   旧分数＝',Student%Score,'   键入新分数＝'
				CALL ReadIntCon(Student%Score)
				WRITE(1,REC=RecNo) Student
			ELSE
				RecNo=RecNo+1
			END IF
		END IF
	END DO
	IF(.NOT.Found) PRINT *,' 没有找到', Item
END SUBROUTINE UpDate
!==================================================
SUBROUTINE StripBlanks(Str)
	CHARACTER(*) :: Str
	INTEGER(1) :: I=1
	DO WHILE(I<LEN_TRIM(Str))
		IF(Str(I:I)==' ') THEN
			Str(I:)=Str(I+1:)
		ELSE
			I=I+1
		END IF
	END DO
END SUBROUTINE StripBlanks
!==================================================
END PROGRAM Student_Records
