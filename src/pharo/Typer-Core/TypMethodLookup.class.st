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
		'superType'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodLookup class >> receiver: aType selector: aSymbol arguments: aCollection parent: aLookup [
	^ self
		receiver: aType
		selector: aSymbol asSymbol
		arguments: aCollection
		self: aType
		super: aType superOrNil
		parent: aLookup
]

{ #category : #accessing }
TypMethodLookup class >> receiver: aType selector: aSymbol arguments: aCollection self: anotherType super: yetAnotherType parent: aLookup [
	^ self index
		at: {aType.
				aSymbol asSymbol.
				aCollection asArray.
				anotherType.
				yetAnotherType.
				aLookup}
		ifAbsentPut: [ self new
				initializeReceiver: aType selector: aSymbol asSymbol;
				initializeArguments: aCollection asArray
					self: anotherType
					super: yetAnotherType;
				initializeParent: aLookup;
				yourself ]
]

{ #category : #accessing }
TypMethodLookup class >> resolver [
	^ resolver
		ifNil: [ resolver := TypTerminalResolver
					resolver: (TypBreadthFirstResolver
							resolvers: {TypDepthFirstResolver resolver: TypPraMethodResolver new.
									TypDepthFirstResolver resolver: TypShaMethodResolver new.
									TypDepthFirstResolver resolver: TypInfMethodResolver new}) ]
]

{ #category : #accessing }
TypMethodLookup >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	anObject self = selfType ifFalse: [ ^ false ].
	^ anObject super = superType
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
TypMethodLookup >> arguments [
	^ arguments
]

{ #category : #converting }
TypMethodLookup >> asParent [
	child ifNotNil: [ ^ child ].
	self assert: [ self hasParent ].
	^ child := self class
			receiver: receiver super
			selector: selector
			arguments: arguments
			self: selfType
			super: receiver super superOrNil
			parent: self
]

{ #category : #accessing }
TypMethodLookup >> canResolve [
	^ receiver canResolveMethod: self
]

{ #category : #accessing }
TypMethodLookup >> compiledMethod [
	receiver hasClassDescription ifFalse: [ ^ nil ].
	^ receiver classDescription lookupSelector: selector
]

{ #category : #invalidation }
TypMethodLookup >> dependsOnCompiledMethod: aCompiledMethod [
	(super dependsOnCompiledMethod: aCompiledMethod) ifTrue: [ ^ true ].
	^ selector = aCompiledMethod selector
		and: [ receiver dependsOnClassDescription: aCompiledMethod methodClass ]
]

{ #category : #accessing }
TypMethodLookup >> hash [
	^ ((super hash bitXor: arguments hash) bitXor: selfType hash)
		bitXor: superType hash
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
	aStream
		nextPut: ${;
		nextPutAll: (' ' join: (arguments collect: #asString));
		nextPut: $};
		nextPut: $ .
	super printOn: aStream
]

{ #category : #accessing }
TypMethodLookup >> resolve [
	self flag: 'FIXME weird'.
	^ [ receiver resolveMethod: self ] ensure: [ self assert: [ result isNotNil ] ]
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
	^ self class
		receiver: (receiver covariant: aType)
		selector: selector
		arguments: arguments
		self: selfType
		super: (aType superOrNil ifNotNil: [ :t | superType covariant: t ])
		parent: parent
]
