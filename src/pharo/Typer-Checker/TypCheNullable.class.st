Class {
	#name : #TypCheNullable,
	#superclass : #TypCheWarning,
	#category : #'Typer-Checker-Core'
}

{ #category : #'*Typer-Checker' }
TypCheNullable class >> node: aNode lookup: aLookup message: aString [
	^ self new
		node: aNode;
		lookup: aLookup;
		messageText: aString;
		yourself
]

{ #category : #accessing }
TypCheNullable >> priority [
	^ 2
]
