Class {
	#name : #TypDynReportVariableItem,
	#superclass : #TypDynReportItem,
	#instVars : [
		'variable'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynReportVariableItem >> path [
	^ {clazz package.
		clazz category.
		clazz instanceSide.
		clazz isInstanceSide}
]

{ #category : #accessing }
TypDynReportVariableItem >> printOn: aStream [
	aStream
		nextPutAll: 'v ';
		nextPutAll: clazz asString;
		nextPutAll: '>>#';
		nextPutAll: name asString;
		nextPutAll: ' i:';
		nextPutAll: inf asString;
		nextPutAll: ' d:';
		nextPutAll: dyn asString.
	infReduced
		ifNotNil: [ aStream
				nextPutAll: '; ri:';
				nextPutAll: infReduced asString;
				nextPutAll: ' rd:';
				nextPutAll: dynReduced asString ]
]
