Class {
	#name : #TypClassType,
	#superclass : #TypType,
	#instVars : [
		'clazz'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypClassType >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ nullable = anObject nullable and: [ clazz = anObject clazz ] ] ]
]

{ #category : #converting }
TypClassType >> asClass [
	^ clazz
]

{ #category : #accessing }
TypClassType >> clazz [
	^ clazz
]

{ #category : #accessing }
TypClassType >> clazz: anObject [
	clazz := anObject
]

{ #category : #testing }
TypClassType >> hasClass [
	^ true
]

{ #category : #'as yet unclassified' }
TypClassType >> hasSuperType [
	^ clazz superclass isNotNil or: [ nullable ]
]

{ #category : #comparing }
TypClassType >> hash [
	^ super hash bitXor: self clazz hash
]

{ #category : #'as yet unclassified' }
TypClassType >> lookupMethod: aSymbol [
	^ (clazz lookupSelector: aSymbol) ifNil: [ TypNoMethodFoundError signal ]
]

{ #category : #'as yet unclassified' }
TypClassType >> lookupVariable: aSymbol [
	(clazz instVarNames includes: aSymbol)
		ifTrue: [ ^ self -> aSymbol ].
	(clazz classVarNames includes: aSymbol)
		ifTrue: [ ^ self -> aSymbol ].
	clazz allSharedPools
		do: [ :e | 
			(e classVarNames includes: aSymbol)
				ifTrue: [ ^ e typAsType -> aSymbol ] ].
	(clazz class instVarNames includes: aSymbol)
		ifTrue: [ ^ self class typAsType -> aSymbol ].
	self hasSuperType
		ifTrue: [ ^ self superType lookupVariable: aSymbol ].
	TypNoVariableFoundError signal
]

{ #category : #printing }
TypClassType >> printOn: aStream [
	clazz printOn: aStream
]

{ #category : #'as yet unclassified' }
TypClassType >> superType [
	^ clazz superclass
		ifNil: [ nullable
				ifTrue: [ TypNilType instance ]
				ifFalse: [ TypNoSuperTypeError signal ] ]
		ifNotNil: #typAsType
]
