Class {
	#name : #TypTypeScanner,
	#superclass : #SmaCCScanner,
	#category : #'Typer-Parser'
}

{ #category : #'generated-initialization' }
TypTypeScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(15 'BlockClosure' 10))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
TypTypeScanner >> emptySymbolTokenId [
	^ 29
]

{ #category : #generated }
TypTypeScanner >> errorTokenId [
	^ 30
]

{ #category : #generated }
TypTypeScanner >> scan1 [
	[ self recordMatch: #(15).
	self step.
	currentCharacter == $>
		ifTrue: [ (self scanForString: '>#')
				ifTrue: [ self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z)
								or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
						ifTrue: [ [ self recordMatch: #(16).
							self step.
							currentCharacter == $:
								ifTrue: [ ^ self scan2 ].
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z)
										or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue.
							^ self reportLastMatch ].
					currentCharacter isSpecial
						ifTrue: [ [ self recordMatch: #(16).
							self step.
							currentCharacter isSpecial ] whileTrue ] ].
			^ self reportLastMatch ].
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
		whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
TypTypeScanner >> scan2 [
	self recordMatch: #(16).
	self step.
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self step.
			currentCharacter == $:
				ifTrue: [ ^ self scan2 ].
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
TypTypeScanner >> scanForToken [
	self step.
	currentCharacter == Character space
		ifTrue:
			[ ^ self scanForTokenX2 ].
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
			[ ^ self scanForTokenX1 ].
	^ self scanForTokenX3
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX1 [
	self step.
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	^ self reportLastMatch
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX2 [
	(self scanForString: 'class')
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	^ self reportLastMatch
]

{ #category : #generated }
TypTypeScanner >> scanForTokenX3 [
	currentCharacter == $<
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $?
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
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
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch
]
