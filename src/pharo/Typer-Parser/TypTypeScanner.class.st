Class {
	#name : #TypTypeScanner,
	#superclass : #SmaCCScanner,
	#category : #'Typer-Parser'
}

{ #category : #generated }
TypTypeScanner >> emptySymbolTokenId [
	^ 27
]

{ #category : #generated }
TypTypeScanner >> errorTokenId [
	^ 28
]

{ #category : #generated }
TypTypeScanner >> scanForToken [
	self step.
	currentCharacter == Character space
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $!
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX2 ].
	^ self scanForTokenX4
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX1 [
	[ self recordMatch: #(14).
	self step.
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX2 [
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	^ self reportLastMatch
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX3 [
	(self scanForString: 'class')
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	^ self reportLastMatch
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX4 [
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(9 14) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue:
			[ self scanForTokenX1 ].
	^ self reportLastMatch
]
