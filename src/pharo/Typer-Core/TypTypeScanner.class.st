Class {
	#name : #TypTypeScanner,
	#superclass : #SmaCCScanner,
	#category : 'Typer-Core-Parser'
}

{ #category : #generated }
TypTypeScanner >> emptySymbolTokenId [
	^ 28
]

{ #category : #generated }
TypTypeScanner >> errorTokenId [
	^ 29
]

{ #category : #generated }
TypTypeScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	^ self scanForTokenX4
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX1 [
	(self scanForString: 'class')
		ifTrue: [ self recordMatch: #(15).
			self step.
			currentCharacter == $T
				ifTrue: [ (self scanForString: 'rait')
						ifTrue: [ ^ self recordAndReportMatch: #(15) ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX2 [
	self recordMatch: #(6).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	^ self reportLastMatch
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX3 [
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	^ self reportLastMatch
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX4 [
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == ${
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter == $}
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(15).
			self step.
			currentCharacter == Character space
				ifTrue:
					[ ^ self scanForTokenX1 ].
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]
