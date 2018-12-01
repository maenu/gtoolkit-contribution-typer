Class {
	#name : #TypTypeScanner,
	#superclass : #SmaCCScanner,
	#category : #'Typer-Parser'
}

{ #category : #generated }
TypTypeScanner >> emptySymbolTokenId [
	^ 12
]

{ #category : #generated }
TypTypeScanner >> errorTokenId [
	^ 13
]

{ #category : #generated }
TypTypeScanner >> scanForToken [
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(5).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]
