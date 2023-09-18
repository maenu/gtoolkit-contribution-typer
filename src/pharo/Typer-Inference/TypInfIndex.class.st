Class {
	#name : #TypInfIndex,
	#superclass : #Object,
	#instVars : [
		'cache',
		'resolver'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new
			              build;
			              yourself ]
]

{ #category : #accessing }
TypInfIndex class >> invalidate [

	<script>
	instance ifNotNil: #invalidate.
	instance := nil
]

{ #category : #accessing }
TypInfIndex >> anonymousClass: aClassDescription [
	^ cache
		at: aClassDescription -> #anonymous
		ifAbsentPut: [ | class |
			class := aClassDescription newAnonymousSubclass.
			class isInstanceSide
				ifTrue: [ class classSide
						compile: (Behavior methodDict at: #basicNew) sourceCode;
						compile: (Behavior methodDict at: #basicNew:) sourceCode;
						compile: 'typInfNew
										^ [ self basicNew ]
											on: Error
											do: [ superclass typInfNew ]' ].
			class ]
]

{ #category : #accessing }
TypInfIndex >> build [
	| behaviors |
	cache removeAll.	"toposort superclasses before subclasses so #allSuperclasses are initialized"
	behaviors := ProtoObject withAllSubclasses asOrderedCollection.	"ProtoObject is last for some reason"
	behaviors addFirst: behaviors removeLast.
	behaviors addAll: ProtoObject class withAllSubclasses.
	behaviors
		do: [ :b | 
			| variables |
			variables := b instanceVariables asIdentitySet.
			b isClass ifTrue: [ variables addAll: b classVariables ].
			variables do: [ :v | cache at: v put: IdentitySet new ].
			b allSuperclassesDo: [ :bb | variables addAll: (cache at: bb) ].
			cache at: b put: variables.
			b methods
				do: [ :m | 
					| c |
					variables
						select: [ :v | v typInfIsWrittenIn: m ]
						thenDo: [ :v | (cache at: v) add: m ].
					cache
						at: m selector
						ifPresent: [ :s | s add: b ]
						ifAbsentPut: [ IdentitySet with: b ].
					c := m methodClass superclass.
					[ c isNil ]
						whileFalse: [ (c lookupSelector: m selector)
								ifNotNil: [ :mm | 
									cache
										at: mm
										ifPresent: [ :s | s add: m ]
										ifAbsentPut: [ IdentitySet with: m ] ].
							c := c superclass ] ] ]
]

{ #category : #accessing }
TypInfIndex >> implementors: aSymbol [

	^ cache at: aSymbol ifAbsent: [ #(  ) ]
]

{ #category : #accessing }
TypInfIndex >> initialize [
	super initialize.
	cache := IdentityDictionary new.
	resolver := TypDepthFirstResolver
			resolver: (TypBreadthFirstResolver
					resolvers: {TypInfAbsMethodResolver new.
							TypInfInlMethodResolver new.
							TypInfMethodResolver instance})
]

{ #category : #accessing }
TypInfIndex >> invalidate [
	cache removeAll
]

{ #category : #accessing }
TypInfIndex >> overriders: aCompiledMethod [
	^ cache at: aCompiledMethod ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfIndex >> resolver [
	^ resolver
]

{ #category : #generated }
TypInfIndex >> writers: aVariable [

	^ cache at: aVariable ifAbsent: [ #(  ) ]
]