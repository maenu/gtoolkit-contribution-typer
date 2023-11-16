Class {
	#name : #TypCheNoMethod,
	#superclass : #TypCheWarning,
	#category : #'Typer-Checker-Core'
}

{ #category : #'*Typer-Checker' }
TypCheNoMethod class >> node: aNode lookup: aLookup [
	^ self new
		node: aNode;
		lookup: aLookup;
		yourself
]

{ #category : #accessing }
TypCheNoMethod >> messageText [
	messageText ifNotNil: [ ^ super messageText ].
	^ messageText := '{1} cannot lookup {2}'
			format: {lookup receiver.
					lookup selector}
]

{ #category : #accessing }
TypCheNoMethod >> priority [
	^ 0
]
