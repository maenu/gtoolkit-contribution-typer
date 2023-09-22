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
			| class |
			class := cache at: m methodClass ifAbsentPut: [ IdentityDictionary new ].
			m typShaIsResolveMethod
				ifTrue: [ | methods |
					methods := class at: #method ifAbsentPut: [ IdentityDictionary new ].
					(methods at: m typShaResolvedMethod ifAbsentPut: [ IdentitySet new ])
						add: m ].
			m typShaIsResolveVariable
				ifTrue: [ | variables |
					variables := class at: #variable ifAbsentPut: [ IdentityDictionary new ].
					(variables at: m typShaResolvedVariable ifAbsentPut: [ IdentitySet new ])
						add: m ].
			m typShaIsResolveType
				ifTrue: [ (class at: #type ifAbsentPut: [ IdentitySet new ]) add: m ] ]
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
		typShaAt: aClassDescription
		at: #method
		at: aSymbol
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaIndex >> typeResolvers: aClassDescription [
	^ cache
		at: aClassDescription class
		at: #type
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaIndex >> variableResolvers: aClassDescription selector: aSymbol [
	^ cache
		typShaAt: aClassDescription
		at: #variable
		at: aSymbol
		ifAbsent: [ #() ]
]
