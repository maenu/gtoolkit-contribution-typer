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
	types := arguments , {receiver}.
	aLookup arguments , {aLookup receiver}
		withIndexDo: [ :t :i | 
			| tt |
			tt := types at: i.
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
	receiver ifNil: [ ^ false ].
	^ receiver canResolveMethod: self
]

{ #category : #accessing }
TypMethodLookup >> hash [
	^ ((super hash bitXor: arguments hash) bitXor: selfType hash)
		bitXor: superType hash
]

{ #category : #accessing }
TypMethodLookup >> initializeArguments: aCollection self: aType super: anotherType [
	arguments := aCollection.
	selfType := aType.
	superType := anotherType
]

{ #category : #invalidation }
TypMethodLookup >> invalidateOnMethodChange: aMethodAnnouncement [

	^ (super invalidateOnMethodChange: aMethodAnnouncement) or:
		  ((receiver invalidateOnMethodChange: aMethodAnnouncement) and: [ 
			   selector = aMethodAnnouncement methodAffected selector ])
]

{ #category : #accessing }
TypMethodLookup >> preResolve [
	^ receiver preResolveMethod: self
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
	^ receiver resolveMethod: self
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
		receiver: aType
		selector: selector
		arguments: arguments
		self: aType
		super: aType superOrNil
		parent: parent
]
