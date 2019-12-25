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
	#superclass : #TypObjectLookup,
	#instVars : [
		'argumentTypes',
		'argumentNodes'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #comparing }
TypMethodLookup >> = anObject [
	^ self == anObject
		or: [ self class == anObject class
				and: [ | object |
					object := anObject "typCastAs TypMethodLookup".
					selector = object selector
						and: [ receiverType = object receiverType
								and: [ argumentTypes asOrderedCollection = object argumentTypes asOrderedCollection
										and: [ argumentNodes asOrderedCollection = object argumentNodes asOrderedCollection ] ] ] ] ]
]

{ #category : #accessing }
TypMethodLookup >> argumentNodes [
	<typTypeResultAs: 'SequenceableCollection<RBValueNode>'>
	^ argumentNodes
]

{ #category : #accessing }
TypMethodLookup >> argumentNodes: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<RBValueNode>'>
	argumentNodes := anObject
]

{ #category : #accessing }
TypMethodLookup >> argumentTypes [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ argumentTypes
]

{ #category : #accessing }
TypMethodLookup >> argumentTypes: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	argumentTypes := anObject
]

{ #category : #'as yet unclassified' }
TypMethodLookup >> emptyResult [
	^ TypMethodLookupResult new
]

{ #category : #comparing }
TypMethodLookup >> hash [
	^ (super hash bitXor: argumentTypes hash) bitXor: argumentNodes hash
]

{ #category : #initialization }
TypMethodLookup >> initialize [
	<typTypeVariable: 'argumentTypes' as: 'SequenceableCollection<TypType>'>
	<typTypeVariable: 'argumentNodes' as: 'SequenceableCollection<RBValueNode>'>
	super initialize
]

{ #category : #accessing }
TypMethodLookup >> postCopy [
	super postCopy.
	argumentTypes := argumentTypes copy.
	argumentNodes := argumentNodes copy
]
