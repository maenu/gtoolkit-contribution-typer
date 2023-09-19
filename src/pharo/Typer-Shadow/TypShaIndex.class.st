Class {
	#name : #TypShaIndex,
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
TypShaIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new
			              build;
			              yourself ]
]

{ #category : #accessing }
TypShaIndex class >> invalidate [

	<script>
	instance ifNotNil: #invalidate.
	instance := nil
]

{ #category : #accessing }
TypShaIndex >> build [
	cache removeAll.
	Smalltalk globals allMethods
		do: [ :m | 
			m typShaIsResolveMethod
				ifTrue: [ (cache
						at: m methodClass -> #method -> m typShaResolvedMethod
						ifAbsentPut: [ IdentitySet new ]) add: m ].
			m typShaIsResolveVariable
				ifTrue: [ (cache
						at: m methodClass -> #variable -> m typShaResolvedVariable
						ifAbsentPut: [ IdentitySet new ]) add: m ].
			m typShaIsResolveType
				ifTrue: [ (cache at: m methodClass -> #type ifAbsentPut: [ IdentitySet new ]) add: m ] ]
]

{ #category : #accessing }
TypShaIndex >> initialize [
	super initialize.
	cache := Dictionary new
]

{ #category : #accessing }
TypShaIndex >> invalidate [
	cache removeAll
]

{ #category : #accessing }
TypShaIndex >> methodResolvers: aClassDescription selector: aSymbol [
	^ cache at: aClassDescription -> #method -> aSymbol ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaIndex >> typeResolvers: aClassDescription [
	^ cache at: aClassDescription class -> #type ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaIndex >> variableResolvers: aClassDescription selector: aSymbol [
	^ cache at: aClassDescription -> #variable -> aSymbol ifAbsent: [ #() ]
]
