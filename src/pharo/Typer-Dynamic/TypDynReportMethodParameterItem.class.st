Class {
	#name : #TypDynReportMethodParameterItem,
	#superclass : #TypDynReportItem,
	#instVars : [
		'parameter'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynReportMethodParameterItem >> gtSourceFor: aView [
	<gtView>
	^ aView forward
		title: 'Source';
		priority: 10;
		object: [ key key key >> key key value ];
		view: #gtSourceFor:
]

{ #category : #accessing }
TypDynReportMethodParameterItem >> parameter [
	^ parameter
]

{ #category : #accessing }
TypDynReportMethodParameterItem >> parameter: anObject [
	parameter := anObject
]

{ #category : #accessing }
TypDynReportMethodParameterItem >> path [
	| method |
	method := clazz >> name.

	^ {method package.
		method isExtension ifTrue: [ #extension ] ifFalse: [ clazz category ].
		clazz instanceSide.
		clazz isInstanceSide}
]

{ #category : #accessing }
TypDynReportMethodParameterItem >> printOn: aStream [
	aStream
		nextPutAll: 'm ';
		nextPutAll: clazz asString;
		nextPutAll: '>>#';
		nextPutAll: name asString;
		nextPutAll: '#';
		nextPutAll: parameter asString;
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
