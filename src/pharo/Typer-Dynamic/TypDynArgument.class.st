Class {
	#name : #TypDynArgument,
	#superclass : #TypDynItem,
	#instVars : [
		'index'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynArgument >> gtSourceFor: aView [
	<gtView>
	^ aView forward
		title: 'Source';
		priority: 10;
		object: [ clazz >> name ];
		view: #gtSourceFor:
]

{ #category : #accessing }
TypDynArgument >> index [
	^ index
]

{ #category : #accessing }
TypDynArgument >> index: anInteger [
	index := anInteger
]

{ #category : #accessing }
TypDynArgument >> path [
	^ super path
		, {#method.
				name.
				index}
]

{ #category : #accessing }
TypDynArgument >> printOn: aStream [
	name isUnary ifTrue: [ aStream nextPutAll: name asString ].
	index > 0
		ifTrue: [ name isBinary ifTrue: [ aStream nextPutAll: name asString ].
			name isKeyword ifTrue: [ aStream nextPutAll: (name keywords at: index) ] ].
	aStream
		nextPutAll: ' i:';
		nextPutAll: inf asString;
		nextPutAll: ' d:';
		nextPutAll: dyn asString
]
