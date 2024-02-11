Class {
	#name : #TypDynItem,
	#superclass : #Object,
	#instVars : [
		'dyn',
		'inf',
		'clazz',
		'name'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynItem >> clazz [
	^ clazz
]

{ #category : #accessing }
TypDynItem >> clazz: anObject [
	clazz := anObject
]

{ #category : #accessing }
TypDynItem >> color [
	| coverage |
	coverage := self coverage.
	coverage = #unknownDynUnknownInf
		ifTrue: [ ^ Color white typGtMix: 0.7 with: BrGlamorousColors primaryBorderColor ].
	coverage = #knownDynUnknownInf
		ifTrue: [ ^ BrGlamorousColors primaryBorderColor ].
	coverage = #unknownDynKnownInf
		ifTrue: [ ^ BrGlamorousColors primaryBorderColor
				typGtMix: 0.3
				with: BrGlamorousColors successBackgroundColor ].
	(self compareWith: #=)
		ifNotNil: [ :e | 
			^ BrGlamorousColors successBackgroundColor
				typGtMix: (e - 1) / 5
				with: BrGlamorousColors failureBackgroundColor ].
	(self compareWith: #<)
		ifNotNil: [ :e | 
			^ BrGlamorousColors failureBackgroundColor
				typGtMix: (e - 1) / 5
				with: BrGlamorousColors errorBackgroundColor ].
	(self compareWith: #>)
		ifNotNil: [ :e | ^ BrGlamorousColors errorBackgroundColor typGtMix: (e - 1) / 5 with: Color black ].
	(self
		isUnknown: {dyn typDynWithoutUnion.
				inf typDynWithoutUnknown typDynWithoutUnion} typAsType superOrNil)
		ifFalse: [ ^ BrGlamorousColors failureBackgroundColor
				typGtMix: 0.5
				with: BrGlamorousColors errorBackgroundColor ].
	^ BrGlamorousColors errorBackgroundColor
]

{ #category : #accessing }
TypDynItem >> compareWith: aSymbol [
	| a b |
	((self isUnknown: (a := dyn)) or: [ self isUnknown: (b := inf) ])
		ifTrue: [ ^ nil ].
	(a perform: aSymbol with: b) ifTrue: [ ^ 1 ].
	(a perform: aSymbol with: (b := b typDynWithoutUnknown)) ifTrue: [ ^ 2 ].
	((a := a typDynWithoutUnion) perform: aSymbol with: (b := b typDynWithoutUnion))
		ifTrue: [ ^ 3 ].
	(a isNamed & b isNamed and: [ a name = b name ]) ifTrue: [ ^ 4 ].
	^ nil
]

{ #category : #accessing }
TypDynItem >> coverage [
	| d i |
	d := self isUnknown: dyn.
	i := self isUnknown: inf.
	d & i ifTrue: [ ^ #unknownDynUnknownInf ].
	d ifTrue: [ ^ #unknownDynKnownInf ].
	i ifTrue: [ ^ #knownDynUnknownInf ].
	^ #knownDynKnownInf
]

{ #category : #accessing }
TypDynItem >> dyn [

	^ dyn
]

{ #category : #accessing }
TypDynItem >> dyn: anObject [

	dyn := anObject
]

{ #category : #accessing }
TypDynItem >> inf [

	^ inf
]

{ #category : #accessing }
TypDynItem >> inf: anObject [

	inf := anObject
]

{ #category : #accessing }
TypDynItem >> isUnknown: aType [
	aType ifNil: [ ^ true ].
	aType isVoid ifTrue: [ ^ true ].
	^ aType isUnion not and: [ aType >= Object typAsType ]
]

{ #category : #accessing }
TypDynItem >> name [
	^ name
]

{ #category : #accessing }
TypDynItem >> name: anObject [
	name := anObject
]

{ #category : #accessing }
TypDynItem >> path [
	^ {clazz package name.
		clazz category.
		clazz instanceSide.
		clazz isInstanceSide ifTrue: #instanceSide ifFalse: #classSide}
]

{ #category : #accessing }
TypDynItem >> rank [

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
