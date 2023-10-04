Class {
	#name : #TypDynReportItem,
	#superclass : #Object,
	#instVars : [
		'clazz',
		'name',
		'dyn',
		'inf',
		'infReduced',
		'dynReduced'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynReportItem >> clazz [

	^ clazz
]

{ #category : #accessing }
TypDynReportItem >> clazz: anObject [

	clazz := anObject
]

{ #category : #accessing }
TypDynReportItem >> dyn [

	^ dyn
]

{ #category : #accessing }
TypDynReportItem >> dyn: anObject [

	dyn := anObject
]

{ #category : #accessing }
TypDynReportItem >> dynReduced [

	^ dynReduced
]

{ #category : #accessing }
TypDynReportItem >> inf [

	^ inf
]

{ #category : #accessing }
TypDynReportItem >> inf: anObject [

	inf := anObject
]

{ #category : #accessing }
TypDynReportItem >> infReduced [

	^ infReduced
]

{ #category : #accessing }
TypDynReportItem >> isUnknown: aType [

	^ aType isUnion not and: [ aType >= Object typAsType ]
]

{ #category : #accessing }
TypDynReportItem >> name [

	^ name
]

{ #category : #accessing }
TypDynReportItem >> name: anObject [

	name := anObject
]

{ #category : #printing }
TypDynReportItem >> printOn: aStream [

	aStream
		nextPutAll: dyn asString;
		nextPutAll: ' ';
		nextPutAll: inf asString;
		nextPutAll: ' | ';
		nextPutAll: dynReduced asString;
		nextPutAll: ' ';
		nextPutAll: infReduced asString
]

{ #category : #accessing }
TypDynReportItem >> rank [

	| d i |
	dynReduced := dyn.
	infReduced := inf.
	d := self isUnknown: dynReduced.
	i := self isUnknown: infReduced.
	d & i ifTrue: [ ^ '7 dyn = ? & inf = ?' ].
	d ifTrue: [ ^ '6 dyn = ? & inf ~= ?' ].
	i ifTrue: [ ^ '5 dyn ~= ? & inf = ?' ].
	dynReduced = infReduced ifTrue: [ ^ '1 dyn = inf' ].
	infReduced := inf typDynWithoutUnknown.
	dynReduced = infReduced ifTrue: [ ^ '2 dyn = inf - ?' ].
	dynReduced := dyn typDynWithoutUnion.
	infReduced := infReduced typDynWithoutUnion.
	dynReduced = infReduced ifTrue: [ ^ '3 s(dyn) = s(inf - ?)' ].
	dynReduced < infReduced ifTrue: [ ^ '4 dyn < inf' ].
	dynReduced > infReduced ifTrue: [ ^ '4 dyn > inf' ].
	^ '4 dyn ~= inf'
]
