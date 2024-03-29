"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	argumentNodes:		<Object>
	argumentTypes:		<Object>


    Implementation Points
"
Class {
	#name : #TypMethodLookup,
	#superclass : #TypPropertyLookup,
	#instVars : [
		'arguments',
		'selfType',
		'superType',
		'context'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodLookup class >> receiver: aType selector: aSymbol arguments: aCollection [
	^ self
		receiver: aType
		selector: aSymbol asSymbol
		arguments: aCollection
		self: aType
		super: aType superOrNil
]

{ #category : #accessing }
TypMethodLookup class >> receiver: aType selector: aSymbol arguments: aCollection self: anotherType super: yetAnotherType [
	^ self index
		typAt: {aType.
				aSymbol asSymbol.
				anotherType.
				yetAnotherType.
				aCollection size} , aCollection
		ifAbsentPut: [ self new
				initializeReceiver: aType selector: aSymbol asSymbol;
				initializeArguments: aCollection asArray
					self: anotherType
					super: yetAnotherType;
				yourself ]
]

{ #category : #accessing }
TypMethodLookup class >> resolver [
	^ resolver
		ifNil: [ resolver := TypBreadthFirstResolver
					resolvers: {TypDepthFirstResolver resolver: TypPraMethodResolver new.
							TypDepthFirstResolver resolver: TypShaMethodResolver new.
							TypDepthFirstResolver resolver: TypInfMethodResolver new} ]
]

{ #category : #accessing }
TypMethodLookup >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	anObject self = selfType ifFalse: [ ^ false ].
	anObject super = superType ifFalse: [ ^ false ].
	^ anObject arguments = arguments
]

{ #category : #accessing }
TypMethodLookup >> > aLookup [
	| found types |
	found := false.
	types := {receiver} , arguments.
	{aLookup receiver} , aLookup arguments
		withIndexDo: [ :t :i | 
			| tt |
			tt := types at: i ifAbsent: [ ^ false ].
			tt >= t ifFalse: [ ^ false ].
			tt = t ifFalse: [ found := true ] ].
	^ found
]

{ #category : #accessing }
TypMethodLookup >> absorbed: aLookup [
	^ self class
		receiver: (receiver covariant: aLookup receiver)
		selector: selector
		arguments: (arguments
				with: aLookup arguments
				collect: [ :a :b | a covariant: b ])
		self: (selfType covariant: aLookup self)
		super: (superType
				ifNil: [ aLookup super ]
				ifNotNil: [ aLookup super ifNil: [ superType ] ifNotNil: [ :t | superType covariant: t ] ])
]

{ #category : #accessing }
TypMethodLookup >> arguments [
	^ arguments
]

{ #category : #accessing }
TypMethodLookup >> canAbsorb: aLookup [
	aLookup selector = selector ifFalse: [ ^ false ].
	(receiver covariant: aLookup receiver) isUnion ifTrue: [ ^ false ].
	(selfType covariant: aLookup self) isUnion ifTrue: [ ^ false ].
	(superType
		ifNil: [ aLookup super ]
		ifNotNil: [ aLookup super ifNil: [ superType ] ifNotNil: [ :t | superType covariant: t ] ])
		ifNotNil: [ :t | t isUnion ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
TypMethodLookup >> compiledMethod [
	receiver hasClassDescription ifFalse: [ ^ nil ].
	^ receiver classDescription lookupSelector: selector
]

{ #category : #accessing }
TypMethodLookup >> context [
	resolved ifNil: [ self result ].
	^ context
]

{ #category : #accessing }
TypMethodLookup >> context: aContext [
	context := aContext.
	result := TypUnknownType instance
]

{ #category : #accessing }
TypMethodLookup >> contextAsyncWithTallyFor: aDuration [
	| tally |
	tally := MessageTally new.
	^ ([ tally spyEvery: 1 on: [ self context ] ] typAsAsyncFuture
		typAwaitFor: aDuration) then: [ tally ] otherwise: [ tally ]
]

{ #category : #invalidation }
TypMethodLookup >> dependsOnCompiledMethod: aCompiledMethod [
	(super dependsOnCompiledMethod: aCompiledMethod) ifTrue: [ ^ true ].
	aCompiledMethod selector = selector ifFalse: [ ^ false ].
	(receiver dependsOnClassDescription: aCompiledMethod methodClass)
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #accessing }
TypMethodLookup >> hash [
	^ (arguments hash bitXor: selfType hash) bitXor: superType hash
]

{ #category : #accessing }
TypMethodLookup >> initializeArguments: aCollection self: aType super: anotherType [
	self assert: [ aType isKindOf: TypType ].
	self assert: [ aType isUnion not ].
	anotherType
		ifNotNil: [ self assert: [ anotherType isKindOf: TypType ].
			self assert: [ anotherType isUnion not ] ].
	arguments := aCollection.
	selfType := aType.
	superType := anotherType
]

{ #category : #accessing }
TypMethodLookup >> printOn: aStream [
	receiver printOn: aStream.
	aStream nextPutAll: '#'.
	arguments
		ifEmpty: [ aStream nextPutAll: selector ]
		ifNotEmpty: [ selector keywords
				with: arguments
				do: [ :k :t | 
					aStream
						nextPutAll: k;
						nextPut: Character space;
						nextPutAll: t asString;
						nextPut: Character space ] ].
	resolved ifNil: [ ^ self ].
	resolved == self ifTrue: [ ^ self ].
	aStream nextPutAll: ' | '.
	resolved printOn: aStream
]

{ #category : #accessing }
TypMethodLookup >> reset [
	resolved := nil.
	result := nil.
	context := nil
]

{ #category : #accessing }
TypMethodLookup >> resultAsync [
	^ [ self result ] typAsAsyncFuture typAwait
]

{ #category : #accessing }
TypMethodLookup >> resultAsyncFor: aDuration [
	^ [ self result ] typAsAsyncFuture typAwaitFor: aDuration
]

{ #category : #accessing }
TypMethodLookup >> resultAsyncWithTallyFor: aDuration [
	| tally |
	tally := MessageTally new.
	^ ([ tally spyEvery: 1 on: [ self result ] ] typAsAsyncFuture
		typAwaitFor: aDuration) then: [ tally ] otherwise: [ tally ]
]

{ #category : #accessing }
TypMethodLookup >> self [
	^ selfType
]

{ #category : #accessing }
TypMethodLookup >> super [
	^ superType
]

{ #category : #accessing }
TypMethodLookup >> withReceiver: aType [
	aType <= receiver
		ifTrue: [ ^ self class
				receiver: aType
				selector: selector
				arguments: arguments
				self: (selfType covariant: aType)
				super: (aType superOrNil
						ifNotNil: [ :t | superType ifNil: [ t ] ifNotNil: [ :tt | tt covariant: t ] ]) ].
	aType > receiver
		ifTrue: [ ^ self class
				receiver: aType
				selector: selector
				arguments: arguments
				self: selfType
				super: superType ].
	^ self class
		receiver: aType
		selector: selector
		arguments: arguments
		self: aType
		super: aType superOrNil
]

{ #category : #accessing }
TypMethodLookup >> withSelf: aType super: anotherTypeOrNil [
	^ self class
		receiver: receiver
		selector: selector
		arguments: arguments
		self: aType
		super: anotherTypeOrNil
]
