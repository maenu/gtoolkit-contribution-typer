Class {
	#name : #TypShaMethodIndex,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new
			              build;
			              yourself ]
]

{ #category : #accessing }
TypShaMethodIndex class >> invalidate [

	<script>
	instance ifNotNil: #invalidate.
	instance := nil
]

{ #category : #accessing }
TypShaMethodIndex >> anonymousClass: aClassDescription [
	^ cache
		at: aClassDescription
		ifAbsentPut: [ | class |
			class := aClassDescription newAnonymousSubclass.
			class isInstanceSide
				ifTrue: [ class classSide
						compile: (Behavior methodDict at: #basicNew) sourceCode;
						compile: (Behavior methodDict at: #basicNew:) sourceCode;
						compile: 'typShaNew ^ [ self new ] on: Error do: [ [ self basicNew ] on: Error do: [ superclass typShaNew ] ]' ].
			class ]
]

{ #category : #accessing }
TypShaMethodIndex >> build [
	cache removeAll.
	Smalltalk globals allMethods
		do: [ :m | 
			m typShaIsResolveMethod
				ifTrue: [ (cache
						at: m methodClass -> #method -> m typShaResolvedMethod
						ifAbsentPut: [ IdentitySet new ]) add: m selector ].
			m typShaIsResolveVariable
				ifTrue: [ (cache
						at: m methodClass -> #variable -> m typShaResolvedVariable
						ifAbsentPut: [ IdentitySet new ]) add: m selector ].
			m typShaIsResolveType
				ifTrue: [ (cache at: m methodClass -> #type ifAbsentPut: [ IdentitySet new ])
						add: m selector ] ]
]

{ #category : #accessing }
TypShaMethodIndex >> initialize [
	super initialize.
	cache := Dictionary new
]

{ #category : #accessing }
TypShaMethodIndex >> methodResolvers: aClassDescription selector: aSymbol [
	^ cache at: aClassDescription -> #method -> aSymbol ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaMethodIndex >> typeResolvers: aClassDescription [
	^ cache at: aClassDescription -> #type ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaMethodIndex >> variableResolvers: aClassDescription selector: aSymbol [
	^ cache at: aClassDescription -> #variable -> aSymbol ifAbsent: [ #() ]
]
