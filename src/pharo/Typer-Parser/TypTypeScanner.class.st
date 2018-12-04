Class {
	#name : #TypTypeScanner,
	#superclass : #SmaCCScanner,
	#category : #'Typer-Parser'
}

{ #category : #'generated-initialization' }
TypTypeScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(7 'nil' 6))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #generated }
TypTypeScanner >> emptySymbolTokenId [
	^ 14
]

{ #category : #generated }
TypTypeScanner >> errorTokenId [
	^ 15
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
		ifTrue: [ ^ self recordAndReportMatch: #(5 7) ].
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z)
				or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ])
		ifTrue: [ [ self recordMatch: #(7).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z)
						or: [ currentCharacter == $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch
]
