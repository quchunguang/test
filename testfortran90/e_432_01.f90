PROGRAM Computer_Usage_Records
!===========================================================
!从键盘上读取用户号码，搜索计算机使用记录文件，如果号码一致，
!则显示用户的信息
!
!Computer_Usage_Info : 
!FileName            : 
!OpenStatus          :
!InputStatus         :
!User                : 
!InputNumber         : 
!UserNumber          : 
!Found               : 

!输入（键盘）：InputNumber
!输入（文件）：UserNumber, User中的用户其他信息
!输出（屏幕）：用户号码，姓名，帐面余额
!===========================================================
IMPLICIT NONE
TYPE Computer_Usage_Info
	CHARACTER(15) :: LastName, FirstName
	INTEGER       :: IdNumber
	CHARACTER(6)  :: Password
	INTEGER       :: ResourceLimit
	REAL          :: ResourceUsed
END TYPE Computer_Usage_Info

CHARACTER(20) :: FileName
TYPE(Computer_Usage_Info) :: User
INTEGER :: OpenStatus, InputStatus, InputNumber, UserNumber
LOGICAL :: Found

WRITE(*,'(a)',ADVANCE='NO') '键入文件名='
READ *, FileName
OPEN(UNIT=10,FILE=FileName,STATUS='OLD',IOSTAT=OpenStatus)
IF(OpenStatus>0) STOP '不能打开文件'

DO
	PRINT *
	WRITE(*,'(a)',ADVANCE='NO') '键入用户号码（中止时为0）='
	READ *, InputNumber
	IF(InputNumber==0) EXIT
	DO
		READ(10,'(T31,I5)', IOSTAT=InputStatus) UserNumber
		IF(InputStatus>0) STOP '读入错误'
		IF(InputStatus<0) EXIT
		Found=(InputNumber==UserNumber)
		IF(Found) EXIT
	END DO
	IF(Found) THEN
		BACKSPACE 10
		READ(10,'(2A15,10X,I4,F5.2)') &
			User%LastName, User%FirstName, &
			User%ResourceLimit, User%ResourceUsed
		PRINT '(I5,1X,2A15/"总额＝",I4,"  余额＝",F5.2)', &
			UserNumber, User%FirstName, User%LastName, &
			User%ResourceLimit, User%ResourceUsed
	ELSE
		PRINT *,'没有找到用户',InputNumber
	END IF
	REWIND 10
END DO
END PROGRAM Computer_Usage_Records
