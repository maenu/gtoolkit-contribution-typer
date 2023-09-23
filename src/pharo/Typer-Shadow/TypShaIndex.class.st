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
						typAt: m methodClass
						at: #method
						at: m typShaResolvedMethod
						ifAbsentPut: [ IdentitySet new ]) add: m ].
			m typShaIsResolveVariable
				ifTrue: [ (cache
						typAt: m methodClass
						at: #variable
						at: m typShaResolvedVariable
						ifAbsentPut: [ IdentitySet new ]) add: m ].
			m typShaIsResolveType
				ifTrue: [ (cache
						typAt: m methodClass
						at: #type
						at: #type
						ifAbsentPut: [ IdentitySet new ]) add: m ] ]
]

{ #category : #accessing }
TypShaIndex >> initialize [
	super initialize.
	cache := IdentityDictionary new
]

{ #category : #accessing }
TypShaIndex >> invalidate [
	cache removeAll
]

{ #category : #accessing }
TypShaIndex >> methodResolvers: aClassDescription selector: aSymbol [
	^ cache
		typAt: aClassDescription
		at: #method
		at: aSymbol
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaIndex >> typeResolvers: aClassDescription [
	^ cache
		typAt: aClassDescription class
		at: #type
		at: #type
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaIndex >> variableResolvers: aClassDescription selector: aSymbol [
	^ cache
		typAt: aClassDescription
		at: #variable
		at: aSymbol
		ifAbsent: [ #() ]
]
