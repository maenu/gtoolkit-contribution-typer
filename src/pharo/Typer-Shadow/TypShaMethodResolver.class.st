Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypShaResolver,
	#instVars : [
		'anonymousClasses'
	],
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodResolver >> anonymousClass: aClassDescription [
	^ anonymousClasses
		at: aClassDescription
		ifAbsentPut: [ | class |
			class := aClassDescription newAnonymousSubclass.
			class isInstanceSide
				ifTrue: [ class
						compile: 'typShaPerform: aSelector with: anObject <primitive: 83> self primitiveFailed'.
					class classSide
						compile: 'typShaNew ^ [ self new ] on: Error do: [ self basicNew ]';
						compile: (Behavior methodDict at: #basicNew) sourceCode;
						compile: (Behavior methodDict at: #basicNew:) sourceCode ].
			class ]
]

{ #category : #accessing }
TypShaMethodResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ aLookup receiver classDescription typShaResolvesMethod: aLookup
]

{ #category : #accessing }
TypShaMethodResolver >> initialize [
	super initialize.
	anonymousClasses := IdentityDictionary new
]

{ #category : #accessing }
TypShaMethodResolver >> invalidate [
	self flag: 'TODO change listeners'.
	super invalidate.
	anonymousClasses removeAll
]

{ #category : #printing }
TypShaMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'sha method'
]

{ #category : #accessing }
TypShaMethodResolver >> resolve: aLookup [
	| class |
	self assert: [ self canResolve: aLookup ].
	aLookup initializeResolver: self.
	class := self anonymousClass: aLookup receiver classDescription.
	^ self
		resolve: aLookup
		reduce: (aLookup receiver classDescription typShaResolveMethod: aLookup receiver: class)
]

{ #category : #accessing }
TypShaMethodResolver >> shadows: aLookup [
	anonymousClasses
		at: aLookup receiver classDescription
		ifAbsentPut: [ aLookup receiver classDescription methods
				select: [ :m | m typShaResolvesMethod: aLookup selector ]
				thenCollect: [ :m | 
					| class |
					class := aLookup receiver classDescription newAnonymousSubclass.
					class isClassSide
						ifTrue: [ [ class perform: m selector with: aLookup ] ]
						ifFalse: [ class
								compile: 'typShaPerform: aSelector with: anObject <primitive: 83> self primitiveFailed'.
							class classSide
								compile: 'typShaNew ^ [ self new ] on: Error do: [ self basicNew ]';
								compile: (Behavior methodDict at: #basicNew) sourceCode;
								compile: (Behavior methodDict at: #basicNew:) sourceCode.
							class ] ] ]
]
