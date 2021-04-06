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
		'arguments'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodLookup class >> receiver: aType selector: aSymbol arguments: aCollection [
	^ self new
		initializeReceiver: aType selector: aSymbol;
		initializeArguments: aCollection;
		yourself
]

{ #category : #accessing }
TypMethodLookup >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	^ anObject arguments = arguments
]

{ #category : #accessing }
TypMethodLookup >> arguments [
	^ arguments
]

{ #category : #accessing }
TypMethodLookup >> hash [
	^ super hash bitXor: arguments hash
]

{ #category : #accessing }
TypMethodLookup >> initializeArguments: aCollection [
	arguments := aCollection
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
